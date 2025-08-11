import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import '../services/ocr_service.dart';
import '../services/ai_service.dart';
import 'grading_screen.dart';

class ScanResultScreen extends StatefulWidget {
  final String imagePath;

  const ScanResultScreen({super.key, required this.imagePath});

  @override
  State<ScanResultScreen> createState() => _ScanResultScreenState();
}

class _ScanResultScreenState extends State<ScanResultScreen> {
  final TextEditingController _studentNameController = TextEditingController();
  final TextEditingController _testNameController = TextEditingController();
  final Map<String, TextEditingController> _answerControllers = {};
  final Map<String, String> _correctAnswers = {};
  
  String _recognizedText = '';
  bool _isProcessing = false;

  @override
  void initState() {
    super.initState();
    _performOCR();
    _setupSampleData();
  }

  void _setupSampleData() {
    _studentNameController.text = 'Ime Učenika';
    _testNameController.text = 'Test iz Matematike';
    
    // Setup sample correct answers
    for (int i = 1; i <= 10; i++) {
      _correctAnswers[i.toString()] = ['A', 'B', 'C', 'D'][(i - 1) % 4];
    }
  }

  Future<void> _performOCR() async {
    final ocrService = context.read<OCRService>();
    setState(() => _isProcessing = true);
    
    try {
      final text = await ocrService.recognizeTextWithPreprocessing(widget.imagePath);
      setState(() {
        _recognizedText = text;
        _isProcessing = false;
      });
      
      // Setup answer controllers for recognized answers
      _setupAnswerControllers();
    } catch (e) {
      setState(() => _isProcessing = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Greška pri prepoznavanju teksta: $e')),
        );
      }
    }
  }

  void _setupAnswerControllers() {
    final lines = _recognizedText.split('\n');
    int questionNumber = 1;
    
    for (String line in lines) {
      line = line.trim();
      if (_isAnswerPattern(line)) {
        final answer = _extractAnswerLetter(line);
        _answerControllers[questionNumber.toString()] = TextEditingController(text: answer);
        questionNumber++;
      }
    }
  }

  bool _isAnswerPattern(String text) {
    final answerPattern = RegExp(r'^\d+[\.\)]\s*[A-Da-d]');
    return answerPattern.hasMatch(text);
  }

  String _extractAnswerLetter(String text) {
    final match = RegExp(r'[A-Da-d]').firstMatch(text);
    return match?.group(0)?.toUpperCase() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rezultati Skeniranja'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: _isProcessing
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 20),
                  Text('Prepoznavanje teksta...'),
                ],
              ),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image Preview
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        File(widget.imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  // Test Information
                  const Text(
                    'Informacije o testu',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  
                  TextField(
                    controller: _studentNameController,
                    decoration: const InputDecoration(
                      labelText: 'Ime učenika',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  
                  TextField(
                    controller: _testNameController,
                    decoration: const InputDecoration(
                      labelText: 'Naziv testa',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  // Correct Answers Setup
                  const Text(
                    'Točni odgovori',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  
                  ...List.generate(_answerControllers.length, (index) {
                    final questionNumber = (index + 1).toString();
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Text('${questionNumber}. '),
                          const SizedBox(width: 10),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: _correctAnswers[questionNumber],
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              ),
                              items: ['A', 'B', 'C', 'D'].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  setState(() {
                                    _correctAnswers[questionNumber] = newValue;
                                  });
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  const SizedBox(height: 20),
                  
                  // Recognized Answers
                  const Text(
                    'Prepoznati odgovori učenika',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  
                  ..._answerControllers.entries.map((entry) {
                    final questionNumber = entry.key;
                    final controller = entry.value;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Text('${questionNumber}. '),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              controller: controller,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'A, B, C, ili D',
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  const SizedBox(height: 20),
                  
                  // Action Buttons
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () => _analyzeTest(),
                          icon: const Icon(Icons.analytics),
                          label: const Text('Analiziraj Test'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.camera_alt),
                          label: const Text('Ponovno Skeniraj'),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  
                  // Recognized Text (for debugging)
                  if (_recognizedText.isNotEmpty) ...[
                    const Text(
                      'Prepoznati tekst (za provjeru):',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        _recognizedText,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ],
              ),
            ),
    );
  }

  void _analyzeTest() async {
    if (_studentNameController.text.isEmpty || _testNameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Molimo unesite ime učenika i naziv testa')),
      );
      return;
    }

    // Collect student answers from controllers
    final Map<String, String> studentAnswers = {};
    for (final entry in _answerControllers.entries) {
      final answer = entry.value.text.trim().toUpperCase();
      if (answer.isNotEmpty && ['A', 'B', 'C', 'D'].contains(answer)) {
        studentAnswers[entry.key] = answer;
      }
    }

    if (studentAnswers.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nema prepoznatih odgovora za analizu')),
      );
      return;
    }

    // Start AI analysis
    final aiService = context.read<AIService>();
    final results = await aiService.analyzeTest(
      recognizedText: _recognizedText,
      correctAnswers: _correctAnswers,
      studentName: _studentNameController.text,
      testName: _testNameController.text,
    );

    if (mounted && results.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GradingScreen(
            aiResults: results,
            studentName: _studentNameController.text,
            testName: _testNameController.text,
            recognizedText: _recognizedText,
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _studentNameController.dispose();
    _testNameController.dispose();
    for (final controller in _answerControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }
}
