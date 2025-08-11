import 'package:flutter/material.dart';

class AIService extends ChangeNotifier {
  bool _isProcessing = false;
  Map<String, dynamic>? _analysisResults;

  bool get isProcessing => _isProcessing;
  Map<String, dynamic>? get analysisResults => _analysisResults;

  Future<Map<String, dynamic>> analyzeTest({
    required String recognizedText,
    required Map<String, String> correctAnswers,
    required String studentName,
    required String testName,
  }) async {
    _isProcessing = true;
    notifyListeners();

    try {
      // Simulate AI processing time
      await Future.delayed(const Duration(seconds: 2));
      
      final results = await _performAnalysis(recognizedText, correctAnswers);
      
      _analysisResults = results;
      _isProcessing = false;
      notifyListeners();
      
      return results;
    } catch (e) {
      _isProcessing = false;
      notifyListeners();
      debugPrint('Greška pri AI analizi: $e');
      return {};
    }
  }

  Future<Map<String, dynamic>> _performAnalysis(
    String recognizedText,
    Map<String, String> correctAnswers,
  ) async {
    final Map<String, dynamic> analysis = {};
    final List<String> studentAnswers = _extractStudentAnswers(recognizedText);
    
    int correctCount = 0;
    int incorrectCount = 0;
    int unansweredCount = 0;
    final List<Map<String, dynamic>> detailedAnalysis = [];
    
    // Analyze each question
    for (int i = 1; i <= correctAnswers.length; i++) {
      final questionKey = i.toString();
      final correctAnswer = correctAnswers[questionKey] ?? '';
      final studentAnswer = i <= studentAnswers.length ? studentAnswers[i - 1] : '';
      
      bool isCorrect = false;
      String confidence = 'srednja';
      
      if (studentAnswer.isEmpty) {
        unansweredCount++;
        confidence = 'niska';
      } else if (_isAnswerCorrect(studentAnswer, correctAnswer)) {
        correctCount++;
        isCorrect = true;
        confidence = 'visoka';
      } else {
        incorrectCount++;
        confidence = 'visoka';
      }
      
      detailedAnalysis.add({
        'questionNumber': i,
        'studentAnswer': studentAnswer,
        'correctAnswer': correctAnswer,
        'isCorrect': isCorrect,
        'confidence': confidence,
      });
    }
    
    final totalQuestions = correctAnswers.length;
    final score = totalQuestions > 0 ? (correctCount / totalQuestions) * 100 : 0;
    final grade = _calculateGrade(score);
    final overallConfidence = _calculateOverallConfidence(detailedAnalysis);
    
    analysis['studentAnswers'] = studentAnswers;
    analysis['correctCount'] = correctCount;
    analysis['incorrectCount'] = incorrectCount;
    analysis['unansweredCount'] = unansweredCount;
    analysis['totalQuestions'] = totalQuestions;
    analysis['score'] = score;
    analysis['grade'] = grade;
    analysis['confidence'] = overallConfidence;
    analysis['detailedAnalysis'] = detailedAnalysis;
    analysis['recommendations'] = _generateRecommendations(correctCount, incorrectCount, unansweredCount);
    
    return analysis;
  }

  List<String> _extractStudentAnswers(String text) {
    final List<String> answers = [];
    final lines = text.split('\n');
    
    for (String line in lines) {
      line = line.trim();
      if (_isAnswerPattern(line)) {
        final answer = _extractAnswerLetter(line);
        if (answer.isNotEmpty) {
          answers.add(answer);
        }
      }
    }
    
    return answers;
  }

  bool _isAnswerPattern(String text) {
    // Look for patterns like "1. A", "2. B", "1) A", "2) B", etc.
    final answerPattern = RegExp(r'^\d+[\.\)]\s*[A-Da-d]');
    return answerPattern.hasMatch(text);
  }

  String _extractAnswerLetter(String text) {
    // Extract A, B, C, or D from the text
    final match = RegExp(r'[A-Da-d]').firstMatch(text);
    return match?.group(0)?.toUpperCase() ?? '';
  }

  bool _isAnswerCorrect(String studentAnswer, String correctAnswer) {
    return studentAnswer.toUpperCase() == correctAnswer.toUpperCase();
  }

  String _calculateGrade(double score) {
    if (score >= 90) return 'Odličan (5)';
    if (score >= 80) return 'Vrlo dobar (4)';
    if (score >= 70) return 'Dobar (3)';
    if (score >= 60) return 'Dovoljan (2)';
    return 'Nedovoljan (1)';
  }

  String _calculateOverallConfidence(List<Map<String, dynamic>> detailedAnalysis) {
    if (detailedAnalysis.isEmpty) return 'niska';
    
    int highConfidence = 0;
    int totalQuestions = detailedAnalysis.length;
    
    for (final analysis in detailedAnalysis) {
      if (analysis['confidence'] == 'visoka') {
        highConfidence++;
      }
    }
    
    final confidencePercentage = (highConfidence / totalQuestions) * 100;
    
    if (confidencePercentage >= 80) return 'visoka';
    if (confidencePercentage >= 50) return 'srednja';
    return 'niska';
  }

  List<String> _generateRecommendations(int correct, int incorrect, int unanswered) {
    final List<String> recommendations = [];
    
    if (unanswered > 0) {
      recommendations.add('Provjerite jesu li sva pitanja jasno vidljiva na slici');
    }
    
    if (incorrect > correct) {
      recommendations.add('Preporučujemo ručnu provjeru odgovora zbog mogućih grešaka u prepoznavanju');
    }
    
    if (correct > 0) {
      recommendations.add('Sistem je uspješno prepoznao većinu odgovora');
    }
    
    return recommendations;
  }

  Map<String, dynamic> suggestGrade({
    required double score,
    required String confidence,
    required int correctCount,
    required int totalQuestions,
  }) {
    final grade = _calculateGrade(score);
    final reasoning = _generateGradeExplanation(score, confidence, correctCount, totalQuestions);
    
    return {
      'suggestedGrade': grade,
      'score': score,
      'confidence': confidence,
      'reasoning': reasoning,
      'recommendations': _generateGradeRecommendations(score),
    };
  }

  String _generateGradeExplanation(double score, String confidence, int correctCount, int totalQuestions) {
    String explanation = 'Učenik je točno odgovorio na $correctCount od $totalQuestions pitanja. ';
    
    if (confidence == 'visoka') {
      explanation += 'Pouzdanost analize je visoka. ';
    } else if (confidence == 'srednja') {
      explanation += 'Pouzdanost analize je srednja, preporučujemo ručnu provjeru. ';
    } else {
      explanation += 'Pouzdanost analize je niska, obavezno ručno provjerite rezultate. ';
    }
    
    explanation += 'Ukupan rezultat: ${score.toStringAsFixed(1)}%.';
    
    return explanation;
  }

  List<String> _generateGradeRecommendations(double score) {
    final List<String> recommendations = [];
    
    if (score >= 90) {
      recommendations.add('Odličan rezultat! Učenik pokazuje izvrsno razumijevanje gradiva.');
    } else if (score >= 80) {
      recommendations.add('Vrlo dobar rezultat. Učenik dobro poznaje gradivo.');
    } else if (score >= 70) {
      recommendations.add('Dobar rezultat. Učenik treba dodatno vježbati.');
    } else if (score >= 60) {
      recommendations.add('Dovoljan rezultat. Preporučujemo dodatnu nastavu.');
    } else {
      recommendations.add('Nedovoljan rezultat. Potrebna je dodatna pomoć i podrška.');
    }
    
    return recommendations;
  }

  void clearResults() {
    _analysisResults = null;
    notifyListeners();
  }
}
