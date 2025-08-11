import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class GradingService extends ChangeNotifier {
  bool _isProcessing = false;
  Map<String, dynamic>? _currentGrade;
  List<Map<String, dynamic>> _gradeHistory = [];

  bool get isProcessing => _isProcessing;
  Map<String, dynamic>? get currentGrade => _currentGrade;
  List<Map<String, dynamic>> get gradeHistory => _gradeHistory;

  Future<Map<String, dynamic>> calculateFinalGrade({
    required Map<String, dynamic> aiResults,
    required String studentName,
    required String testName,
    required Map<String, String> teacherCorrections,
  }) async {
    _isProcessing = true;
    notifyListeners();

    try {
      // Apply teacher corrections to AI results
      final adjustedResults = _applyTeacherCorrections(aiResults, teacherCorrections);
      
      // Calculate final grade
      final finalGrade = _calculateGrade(adjustedResults);
      
      // Generate explanation and recommendations
      final explanation = _generateGradeExplanation(finalGrade, studentName, testName);
      final recommendations = _generateRecommendations(finalGrade);
      
      // Create grade record
      final gradeRecord = {
        'studentName': studentName,
        'testName': testName,
        'timestamp': DateTime.now().toIso8601String(),
        'originalScore': aiResults['score'] ?? 0.0,
        'adjustedScore': finalGrade['score'],
        'originalGrade': aiResults['grade'] ?? 'N/A',
        'finalGrade': finalGrade['grade'],
        'confidence': aiResults['confidence'] ?? 'niska',
        'teacherCorrections': teacherCorrections,
        'explanation': explanation,
        'recommendations': recommendations,
        'detailedAnalysis': aiResults['detailedAnalysis'] ?? [],
      };
      
      _currentGrade = gradeRecord;
      
      // Save to history
      await _saveGradeToHistory(gradeRecord);
      
      _isProcessing = false;
      notifyListeners();
      
      return gradeRecord;
    } catch (e) {
      _isProcessing = false;
      notifyListeners();
      debugPrint('Greška pri izračunu ocjene: $e');
      return {};
    }
  }

  Map<String, dynamic> _applyTeacherCorrections(
    Map<String, dynamic> aiResults,
    Map<String, String> teacherCorrections,
  ) {
    final adjustedResults = Map<String, dynamic>.from(aiResults);
    int adjustedCorrectCount = adjustedResults['correctCount'] ?? 0;
    int adjustedIncorrectCount = adjustedResults['incorrectCount'] ?? 0;
    int adjustedUnansweredCount = adjustedResults['unansweredCount'] ?? 0;
    
    // Apply teacher corrections
    for (final entry in teacherCorrections.entries) {
      final questionNumber = int.tryParse(entry.key);
      final correction = entry.value;
      
      if (questionNumber != null && correction != null) {
        // Find the question in detailed analysis
        final detailedAnalysis = List<Map<String, dynamic>>.from(adjustedResults['detailedAnalysis'] ?? []);
        
        for (int i = 0; i < detailedAnalysis.length; i++) {
          if (detailedAnalysis[i]['questionNumber'] == questionNumber) {
            final wasCorrect = detailedAnalysis[i]['isCorrect'] ?? false;
            
            if (correction == 'correct' && !wasCorrect) {
              // Teacher marked as correct
              adjustedCorrectCount++;
              if (detailedAnalysis[i]['studentAnswer'] == '') {
                adjustedUnansweredCount--;
              } else {
                adjustedIncorrectCount--;
              }
              detailedAnalysis[i]['isCorrect'] = true;
              detailedAnalysis[i]['teacherCorrected'] = true;
            } else if (correction == 'incorrect' && wasCorrect) {
              // Teacher marked as incorrect
              adjustedCorrectCount--;
              adjustedIncorrectCount++;
              detailedAnalysis[i]['isCorrect'] = false;
              detailedAnalysis[i]['teacherCorrected'] = true;
            }
            break;
          }
        }
        
        adjustedResults['detailedAnalysis'] = detailedAnalysis;
      }
    }
    
    // Recalculate score
    final totalQuestions = adjustedResults['totalQuestions'] ?? 0;
    final adjustedScore = totalQuestions > 0 ? (adjustedCorrectCount / totalQuestions) * 100 : 0;
    
    adjustedResults['correctCount'] = adjustedCorrectCount;
    adjustedResults['incorrectCount'] = adjustedIncorrectCount;
    adjustedResults['unansweredCount'] = adjustedUnansweredCount;
    adjustedResults['score'] = adjustedScore;
    adjustedResults['grade'] = _calculateGradeFromScore(adjustedScore);
    
    return adjustedResults;
  }

  Map<String, dynamic> _calculateGrade(Map<String, dynamic> results) {
    final score = results['score'] ?? 0.0;
    final grade = _calculateGradeFromScore(score);
    
    return {
      'score': score,
      'grade': grade,
      'correctCount': results['correctCount'] ?? 0,
      'incorrectCount': results['incorrectCount'] ?? 0,
      'unansweredCount': results['unansweredCount'] ?? 0,
      'totalQuestions': results['totalQuestions'] ?? 0,
    };
  }

  String _calculateGradeFromScore(double score) {
    if (score >= 90) return 'Odličan (5)';
    if (score >= 80) return 'Vrlo dobar (4)';
    if (score >= 70) return 'Dobar (3)';
    if (score >= 60) return 'Dovoljan (2)';
    return 'Nedovoljan (1)';
  }

  String _generateGradeExplanation(Map<String, dynamic> grade, String studentName, String testName) {
    final score = grade['score'] ?? 0.0;
    final correctCount = grade['correctCount'] ?? 0;
    final totalQuestions = grade['totalQuestions'] ?? 0;
    
    String explanation = '$studentName je riješio test "$testName" s rezultatom ${score.toStringAsFixed(1)}%. ';
    explanation += 'Točno je odgovorio na $correctCount od $totalQuestions pitanja. ';
    
    if (score >= 90) {
      explanation += 'Ovo je odličan rezultat koji pokazuje izvrsno razumijevanje gradiva.';
    } else if (score >= 80) {
      explanation += 'Ovo je vrlo dobar rezultat koji pokazuje dobro razumijevanje gradiva.';
    } else if (score >= 70) {
      explanation += 'Ovo je dobar rezultat, ali učenik treba dodatno vježbati.';
    } else if (score >= 60) {
      explanation += 'Ovo je dovoljan rezultat, preporučujemo dodatnu nastavu.';
    } else {
      explanation += 'Ovo je nedovoljan rezultat, potrebna je dodatna pomoć i podrška.';
    }
    
    return explanation;
  }

  List<String> _generateRecommendations(Map<String, dynamic> grade) {
    final List<String> recommendations = [];
    final score = grade['score'] ?? 0.0;
    final correctCount = grade['correctCount'] ?? 0;
    final totalQuestions = grade['totalQuestions'] ?? 0;
    
    if (score >= 90) {
      recommendations.add('Odličan rezultat! Učenik pokazuje izvrsno razumijevanje gradiva.');
      recommendations.add('Možete predložiti dodatne izazove ili naprednije gradivo.');
    } else if (score >= 80) {
      recommendations.add('Vrlo dobar rezultat. Učenik dobro poznaje gradivo.');
      recommendations.add('Možete predložiti dodatne vježbe za konsolidaciju znanja.');
    } else if (score >= 70) {
      recommendations.add('Dobar rezultat. Učenik treba dodatno vježbati.');
      recommendations.add('Preporučujemo dodatne vježbe i objašnjavanje težih dijelova.');
    } else if (score >= 60) {
      recommendations.add('Dovoljan rezultat. Preporučujemo dodatnu nastavu.');
      recommendations.add('Možda je potrebno ponoviti osnovne koncepte.');
    } else {
      recommendations.add('Nedovoljan rezultat. Potrebna je dodatna pomoć i podrška.');
      recommendations.add('Preporučujemo individualnu nastavu ili dodatne satove.');
    }
    
    if (correctCount < totalQuestions * 0.5) {
      recommendations.add('Učenik ima poteškoća s većinom pitanja. Potrebna je temeljita revizija gradiva.');
    }
    
    return recommendations;
  }

  Future<void> _saveGradeToHistory(Map<String, dynamic> gradeRecord) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _gradeHistory.add(gradeRecord);
      
      // Keep only last 100 grades
      if (_gradeHistory.length > 100) {
        _gradeHistory = _gradeHistory.sublist(_gradeHistory.length - 100);
      }
      
      await prefs.setString('grade_history', jsonEncode(_gradeHistory));
      notifyListeners();
    } catch (e) {
      debugPrint('Greška pri spremanju ocjene: $e');
    }
  }

  Future<void> loadGradeHistory() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final historyJson = prefs.getString('grade_history');
      
      if (historyJson != null) {
        final List<dynamic> historyList = jsonDecode(historyJson);
        _gradeHistory = historyList.cast<Map<String, dynamic>>();
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Greška pri učitavanju povijesti ocjena: $e');
    }
  }

  Future<void> clearGradeHistory() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('grade_history');
      _gradeHistory = [];
      notifyListeners();
    } catch (e) {
      debugPrint('Greška pri brisanju povijesti ocjena: $e');
    }
  }

  Map<String, dynamic> getGradeStatistics() {
    if (_gradeHistory.isEmpty) {
      return {
        'totalTests': 0,
        'averageScore': 0.0,
        'bestScore': 0.0,
        'worstScore': 0.0,
        'gradeDistribution': {},
      };
    }
    
    double totalScore = 0.0;
    double bestScore = 0.0;
    double worstScore = 100.0;
    Map<String, int> gradeDistribution = {};
    
    for (final grade in _gradeHistory) {
      final score = grade['adjustedScore'] ?? 0.0;
      totalScore += score;
      
      if (score > bestScore) bestScore = score;
      if (score < worstScore) worstScore = score;
      
      final gradeText = grade['finalGrade'] ?? 'N/A';
      gradeDistribution[gradeText] = (gradeDistribution[gradeText] ?? 0) + 1;
    }
    
    return {
      'totalTests': _gradeHistory.length,
      'averageScore': totalScore / _gradeHistory.length,
      'bestScore': bestScore,
      'worstScore': worstScore,
      'gradeDistribution': gradeDistribution,
    };
  }

  void clearCurrentGrade() {
    _currentGrade = null;
    notifyListeners();
  }
}
