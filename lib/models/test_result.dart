class TestResult {
  final String studentName;
  final String testName;
  final DateTime timestamp;
  final double score;
  final String grade;
  final double confidence;
  final int correctAnswers;
  final int incorrectAnswers;
  final int unansweredQuestions;
  final int totalQuestions;
  final List<QuestionAnalysis> detailedAnalysis;
  final Map<String, String> teacherCorrections;
  final String gradeExplanation;
  final List<String> recommendations;

  TestResult({
    required this.studentName,
    required this.testName,
    required this.timestamp,
    required this.score,
    required this.grade,
    required this.confidence,
    required this.correctAnswers,
    required this.incorrectAnswers,
    required this.unansweredQuestions,
    required this.totalQuestions,
    required this.detailedAnalysis,
    required this.teacherCorrections,
    required this.gradeExplanation,
    required this.recommendations,
  });

  factory TestResult.fromMap(Map<String, dynamic> map) {
    return TestResult(
      studentName: map['studentName'] ?? '',
      testName: map['testName'] ?? '',
      timestamp: DateTime.parse(map['timestamp']),
      score: (map['score'] ?? 0.0).toDouble(),
      grade: map['grade'] ?? '',
      confidence: (map['confidence'] ?? 0.0).toDouble(),
      correctAnswers: map['correctAnswers'] ?? 0,
      incorrectAnswers: map['incorrectAnswers'] ?? 0,
      unansweredQuestions: map['unansweredQuestions'] ?? 0,
      totalQuestions: map['totalQuestions'] ?? 0,
      detailedAnalysis: (map['detailedAnalysis'] as List<dynamic>?)
          ?.map((e) => QuestionAnalysis.fromMap(e))
          .toList() ?? [],
      teacherCorrections: Map<String, String>.from(map['teacherCorrections'] ?? {}),
      gradeExplanation: map['gradeExplanation'] ?? '',
      recommendations: List<String>.from(map['recommendations'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'studentName': studentName,
      'testName': testName,
      'timestamp': timestamp.toIso8601String(),
      'score': score,
      'grade': grade,
      'confidence': confidence,
      'correctAnswers': correctAnswers,
      'incorrectAnswers': incorrectAnswers,
      'unansweredQuestions': unansweredQuestions,
      'totalQuestions': totalQuestions,
      'detailedAnalysis': detailedAnalysis.map((e) => e.toMap()).toList(),
      'teacherCorrections': teacherCorrections,
      'gradeExplanation': gradeExplanation,
      'recommendations': recommendations,
    };
  }

  TestResult copyWith({
    String? studentName,
    String? testName,
    DateTime? timestamp,
    double? score,
    String? grade,
    double? confidence,
    int? correctAnswers,
    int? incorrectAnswers,
    int? unansweredQuestions,
    int? totalQuestions,
    List<QuestionAnalysis>? detailedAnalysis,
    Map<String, String>? teacherCorrections,
    String? gradeExplanation,
    List<String>? recommendations,
  }) {
    return TestResult(
      studentName: studentName ?? this.studentName,
      testName: testName ?? this.testName,
      timestamp: timestamp ?? this.timestamp,
      score: score ?? this.score,
      grade: grade ?? this.grade,
      confidence: confidence ?? this.confidence,
      correctAnswers: correctAnswers ?? this.correctAnswers,
      incorrectAnswers: incorrectAnswers ?? this.incorrectAnswers,
      unansweredQuestions: unansweredQuestions ?? this.unansweredQuestions,
      totalQuestions: totalQuestions ?? this.totalQuestions,
      detailedAnalysis: detailedAnalysis ?? this.detailedAnalysis,
      teacherCorrections: teacherCorrections ?? this.teacherCorrections,
      gradeExplanation: gradeExplanation ?? this.gradeExplanation,
      recommendations: recommendations ?? this.recommendations,
    );
  }
}

class QuestionAnalysis {
  final String questionNumber;
  final String correctAnswer;
  final String studentAnswer;
  final bool isCorrect;
  final double confidence;
  final String reasoning;

  QuestionAnalysis({
    required this.questionNumber,
    required this.correctAnswer,
    required this.studentAnswer,
    required this.isCorrect,
    required this.confidence,
    required this.reasoning,
  });

  factory QuestionAnalysis.fromMap(Map<String, dynamic> map) {
    return QuestionAnalysis(
      questionNumber: map['questionNumber']?.toString() ?? '',
      correctAnswer: map['correctAnswer'] ?? '',
      studentAnswer: map['studentAnswer'] ?? '',
      isCorrect: map['isCorrect'] ?? false,
      confidence: (map['confidence'] ?? 0.0).toDouble(),
      reasoning: map['reasoning'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'questionNumber': questionNumber,
      'correctAnswer': correctAnswer,
      'studentAnswer': studentAnswer,
      'isCorrect': isCorrect,
      'confidence': confidence,
      'reasoning': reasoning,
    };
  }
}
