import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/grading_service.dart';

class GradingScreen extends StatefulWidget {
  final Map<String, dynamic> aiResults;
  final String studentName;
  final String testName;
  final String recognizedText;

  const GradingScreen({
    super.key,
    required this.aiResults,
    required this.studentName,
    required this.testName,
    required this.recognizedText,
  });

  @override
  State<GradingScreen> createState() => _GradingScreenState();
}

class _GradingScreenState extends State<GradingScreen> {
  final Map<String, String> _teacherCorrections = {};

  @override
  Widget build(BuildContext context) {
    final aiResults = widget.aiResults;
    final correctCount = aiResults['correctCount'] ?? 0;
    final incorrectCount = aiResults['incorrectCount'] ?? 0;
    final unansweredCount = aiResults['unansweredCount'] ?? 0;
    final totalQuestions = aiResults['totalQuestions'] ?? 0;
    final score = aiResults['score'] ?? 0.0;
    final grade = aiResults['grade'] ?? 'N/A';
    final confidence = aiResults['confidence'] ?? 'niska';
    final detailedAnalysis = List<Map<String, dynamic>>.from(aiResults['detailedAnalysis'] ?? []);
    final recommendations = List<String>.from(aiResults['recommendations'] ?? []);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rezultati Analize'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Student and Test Info
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Učenik: ${widget.studentName}',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Test: ${widget.testName}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Overall Results
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Ukupni rezultati',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: _buildResultCard(
                            'Točno',
                            correctCount.toString(),
                            Colors.green,
                            Icons.check_circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: _buildResultCard(
                            'Netočno',
                            incorrectCount.toString(),
                            Colors.red,
                            Icons.cancel,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: _buildResultCard(
                            'Bez odgovora',
                            unansweredCount.toString(),
                            Colors.orange,
                            Icons.help,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: _buildResultCard(
                            'Rezultat',
                            '${score.toStringAsFixed(1)}%',
                            Colors.blue,
                            Icons.analytics,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: _buildResultCard(
                            'Ocjena',
                            grade,
                            _getGradeColor(score),
                            Icons.grade,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Detailed Analysis
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Detaljna analiza po pitanjima',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    ...detailedAnalysis.map((analysis) => _buildQuestionAnalysis(analysis)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Analysis Confidence
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Pouzdanost analize',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          _getConfidenceIcon(confidence),
                          color: _getConfidenceColor(confidence),
                          size: 24,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Pouzdanost: ${confidence.toUpperCase()}',
                          style: TextStyle(
                            fontSize: 16,
                            color: _getConfidenceColor(confidence),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Recommendations
            if (recommendations.isNotEmpty) ...[
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Preporuke',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      ...recommendations.map((rec) => Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.lightbulb, color: Colors.amber, size: 16),
                            const SizedBox(width: 8),
                            Expanded(child: Text(rec)),
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],

            // Save Grade Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => _saveGrade(),
                icon: const Icon(Icons.save),
                label: const Text('Spremi Ocjenu'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultCard(String title, String value, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(fontSize: 12, color: color),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionAnalysis(Map<String, dynamic> analysis) {
    final questionNumber = analysis['questionNumber'] ?? 0;
    final studentAnswer = analysis['studentAnswer'] ?? '';
    final correctAnswer = analysis['correctAnswer'] ?? '';
    final isCorrect = analysis['isCorrect'] ?? false;
    final confidence = analysis['confidence'] ?? 'srednja';

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Pitanje $questionNumber',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: isCorrect ? Colors.green : Colors.red,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    isCorrect ? 'TOČNO' : 'NETOČNO',
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Odgovor učenika:', style: TextStyle(fontSize: 12)),
                      Text(studentAnswer.isEmpty ? 'Bez odgovora' : studentAnswer),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Točan odgovor:', style: TextStyle(fontSize: 12)),
                      Text(correctAnswer),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  'Pouzdanost: ${confidence.toUpperCase()}',
                  style: TextStyle(
                    fontSize: 12,
                    color: _getConfidenceColor(confidence),
                  ),
                ),
                const Spacer(),
                // Teacher Correction Dropdown
                DropdownButtonFormField<String>(
                  value: _teacherCorrections[questionNumber.toString()],
                  decoration: const InputDecoration(
                    labelText: 'Ispravka',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  ),
                  items: [
                    const DropdownMenuItem(value: null, child: Text('Bez ispravke')),
                    const DropdownMenuItem(value: 'correct', child: Text('Označi kao točno')),
                    const DropdownMenuItem(value: 'incorrect', child: Text('Označi kao netočno')),
                  ],
                  onChanged: (String? value) {
                    setState(() {
                      if (value == null) {
                        _teacherCorrections.remove(questionNumber.toString());
                      } else {
                        _teacherCorrections[questionNumber.toString()] = value;
                      }
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getGradeColor(double score) {
    if (score >= 90) return Colors.green;
    if (score >= 80) return Colors.lightGreen;
    if (score >= 70) return Colors.orange;
    if (score >= 60) return Colors.deepOrange;
    return Colors.red;
  }

  Color _getConfidenceColor(String confidence) {
    switch (confidence.toLowerCase()) {
      case 'visoka':
        return Colors.green;
      case 'srednja':
        return Colors.orange;
      case 'niska':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  IconData _getConfidenceIcon(String confidence) {
    switch (confidence.toLowerCase()) {
      case 'visoka':
        return Icons.verified;
      case 'srednja':
        return Icons.warning;
      case 'niska':
        return Icons.error;
      default:
        return Icons.help;
    }
  }

  void _saveGrade() async {
    final gradingService = context.read<GradingService>();
    
    final gradeRecord = await gradingService.calculateFinalGrade(
      aiResults: widget.aiResults,
      studentName: widget.studentName,
      testName: widget.testName,
      teacherCorrections: _teacherCorrections,
    );

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Ocjena spremljena: ${gradeRecord['finalGrade']}'),
          backgroundColor: Colors.green,
        ),
      );
      
      // Navigate back to home
      Navigator.of(context).popUntil((route) => route.isFirst);
    }
  }
}
