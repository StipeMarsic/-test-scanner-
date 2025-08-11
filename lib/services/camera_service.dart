import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';

class CameraService extends ChangeNotifier {
  CameraController? _controller;
  List<CameraDescription> _cameras = [];
  bool _isInitialized = false;
  bool _isCapturing = false;
  int _selectedCameraIndex = 0;

  CameraController? get controller => _controller;
  List<CameraDescription> get cameras => _cameras;
  bool get isInitialized => _isInitialized;
  bool get isCapturing => _isCapturing;
  int get selectedCameraIndex => _selectedCameraIndex;

  Future<void> initializeCamera() async {
    try {
      _cameras = await availableCameras();
      if (_cameras.isNotEmpty) {
        _controller = CameraController(
          _cameras[_selectedCameraIndex],
          ResolutionPreset.high,
          enableAudio: false,
        );
        await _controller!.initialize();
        _isInitialized = true;
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Greška pri inicijalizaciji kamere: $e');
    }
  }

  Future<bool> requestCameraPermission() async {
    final status = await Permission.camera.request();
    return status.isGranted;
  }

  Future<XFile?> captureImage() async {
    if (_controller == null || !_isInitialized) return null;

    try {
      _isCapturing = true;
      notifyListeners();

      final image = await _controller!.takePicture();
      
      _isCapturing = false;
      notifyListeners();
      
      return image;
    } catch (e) {
      _isCapturing = false;
      notifyListeners();
      debugPrint('Greška pri snimanju: $e');
      return null;
    }
  }

  Future<XFile?> pickImageFromGallery() async {
    try {
      final picker = ImagePicker();
      return await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 85,
      );
    } catch (e) {
      debugPrint('Greška pri odabiru slike: $e');
      return null;
    }
  }

  Future<void> switchCamera() async {
    if (_cameras.length < 2) return;

    _selectedCameraIndex = (_selectedCameraIndex + 1) % _cameras.length;
    
    await _controller?.dispose();
    _controller = CameraController(
      _cameras[_selectedCameraIndex],
      ResolutionPreset.high,
      enableAudio: false,
    );
    
    await _controller!.initialize();
    notifyListeners();
  }

  Future<void> toggleFlash() async {
    if (_controller == null) return;

    try {
      if (_controller!.value.flashMode == FlashMode.off) {
        await _controller!.setFlashMode(FlashMode.torch);
      } else {
        await _controller!.setFlashMode(FlashMode.off);
      }
      notifyListeners();
    } catch (e) {
      debugPrint('Greška pri uključivanju/isključivanju bljeskalice: $e');
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
