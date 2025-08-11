import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image/image.dart' as img;
import 'dart:io';

class OCRService extends ChangeNotifier {
  final TextRecognizer _textRecognizer = GoogleMlKit.vision.textRecognizer();
  bool _isProcessing = false;
  String _recognizedText = '';
  List<String> _extractedAnswers = [];

  bool get isProcessing => _isProcessing;
  String get recognizedText => _recognizedText;
  List<String> get extractedAnswers => _extractedAnswers;

  Future<String> recognizeText(String imagePath) async {
    _isProcessing = true;
    notifyListeners();

    try {
      final inputImage = InputImage.fromFilePath(imagePath);
      final RecognizedText recognizedText = await _textRecognizer.processImage(inputImage);
      
      _recognizedText = recognizedText.text;
      _extractedAnswers = extractAnswers(_recognizedText);
      
      _isProcessing = false;
      notifyListeners();
      
      return _recognizedText;
    } catch (e) {
      _isProcessing = false;
      notifyListeners();
      debugPrint('Greška pri OCR obradi: $e');
      return '';
    }
  }

  Future<String> recognizeTextWithPreprocessing(String imagePath) async {
    _isProcessing = true;
    notifyListeners();

    try {
      // Preprocess image for better OCR results
      final processedImagePath = await _preprocessImage(imagePath);
      
      final inputImage = InputImage.fromFilePath(processedImagePath);
      final RecognizedText recognizedText = await _textRecognizer.processImage(inputImage);
      
      _recognizedText = recognizedText.text;
      _extractedAnswers = extractAnswers(_recognizedText);
      
      _isProcessing = false;
      notifyListeners();
      
      return _recognizedText;
    } catch (e) {
      _isProcessing = false;
      notifyListeners();
      debugPrint('Greška pri OCR obradi s predobradom: $e');
      return '';
    }
  }

  Future<String> _preprocessImage(String imagePath) async {
    try {
      final File imageFile = File(imagePath);
      final List<int> imageBytes = await imageFile.readAsBytes();
      img.Image? image = img.decodeImage(imageBytes);
      
      if (image == null) return imagePath;

      // Convert to grayscale
      image = img.grayscale(image);
      
      // Enhance contrast
      image = img.contrast(image, 150);
      
      // Apply slight blur to reduce noise
      image = img.gaussianBlur(image, 1);
      
      // Resize if too large
      if (image.width > 1920 || image.height > 1080) {
        image = img.copyResize(image, width: 1920, height: 1080);
      }

      // Save processed image
      final processedPath = imagePath.replaceAll('.jpg', '_processed.jpg');
      final processedFile = File(processedPath);
      await processedFile.writeAsBytes(img.encodeJpg(image, quality: 90));
      
      return processedPath;
    } catch (e) {
      debugPrint('Greška pri predobradi slike: $e');
      return imagePath;
    }
  }

  List<String> extractAnswers(String text) {
    final List<String> answers = [];
    final lines = text.split('\n');
    
    for (String line in lines) {
      line = line.trim();
      if (_isAnswerPattern(line)) {
        answers.add(line);
      }
    }
    
    return answers;
  }

  bool _isAnswerPattern(String text) {
    // Look for patterns like "1. A", "2. B", "1) A", "2) B", etc.
    final answerPattern = RegExp(r'^\d+[\.\)]\s*[A-Da-d]');
    return answerPattern.hasMatch(text);
  }

  Map<String, String> extractQuestionAnswerPairs(String text) {
    final Map<String, String> pairs = {};
    final lines = text.split('\n');
    
    String currentQuestion = '';
    
    for (String line in lines) {
      line = line.trim();
      
      if (_isQuestionPattern(line)) {
        currentQuestion = line;
      } else if (_isAnswerPattern(line) && currentQuestion.isNotEmpty) {
        pairs[currentQuestion] = line;
      }
    }
    
    return pairs;
  }

  bool _isQuestionPattern(String text) {
    // Look for patterns like "1.", "2.", "Question 1:", etc.
    final questionPattern = RegExp(r'^\d+[\.\)]|^Question\s+\d+:|^Pitanje\s+\d+:');
    return questionPattern.hasMatch(text);
  }

  void clearResults() {
    _recognizedText = '';
    _extractedAnswers = [];
    notifyListeners();
  }

  @override
  void dispose() {
    _textRecognizer.close();
    super.dispose();
  }
}
