import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:provider/provider.dart';
import '../services/camera_service.dart';
import 'scan_result_screen.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CameraService>().initializeCamera();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Consumer<CameraService>(
        builder: (context, cameraService, child) {
          if (!cameraService.isInitialized) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(color: Colors.white),
                  SizedBox(height: 20),
                  Text(
                    'Inicijalizacija kamere...',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            );
          }

          return Stack(
            children: [
              // Camera Preview
              CameraPreview(cameraService.controller!),
              
              // Overlay UI
              SafeArea(
                child: Column(
                  children: [
                    // Top Bar
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Back Button
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.black.withOpacity(0.5),
                              shape: const CircleBorder(),
                            ),
                          ),
                          
                          // Title
                          const Text(
                            'Skeniraj Test',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          
                          // Flash Toggle
                          IconButton(
                            onPressed: cameraService.toggleFlash,
                            icon: Icon(
                              cameraService.controller?.value.flashMode == FlashMode.torch
                                  ? Icons.flash_on
                                  : Icons.flash_off,
                              color: Colors.white,
                              size: 30,
                            ),
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.black.withOpacity(0.5),
                              shape: const CircleBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    const Spacer(),
                    
                    // Instructions
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Text(
                        'Postavite test u okvir i osigurajte dovoljno svjetla za najbolje rezultate',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    
                    const SizedBox(height: 30),
                    
                    // Bottom Controls
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Gallery Button
                          IconButton(
                            onPressed: () async {
                              final image = await cameraService.pickImageFromGallery();
                              if (image != null && mounted) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ScanResultScreen(imagePath: image.path),
                                  ),
                                );
                              }
                            },
                            icon: const Icon(Icons.photo_library, color: Colors.white, size: 30),
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.black.withOpacity(0.5),
                              shape: const CircleBorder(),
                            ),
                          ),
                          
                          // Capture Button
                          GestureDetector(
                            onTap: cameraService.isCapturing ? null : () async {
                              final image = await cameraService.captureImage();
                              if (image != null && mounted) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ScanResultScreen(imagePath: image.path),
                                  ),
                                );
                              }
                            },
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: cameraService.isCapturing ? Colors.grey : Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 4),
                              ),
                              child: cameraService.isCapturing
                                  ? const Center(child: CircularProgressIndicator())
                                  : const Icon(Icons.camera, size: 40, color: Colors.black),
                            ),
                          ),
                          
                          // Switch Camera Button
                          if (cameraService.cameras.length > 1)
                            IconButton(
                              onPressed: cameraService.switchCamera,
                              icon: const Icon(Icons.flip_camera_ios, color: Colors.white, size: 30),
                              style: IconButton.styleFrom(
                                backgroundColor: Colors.black.withOpacity(0.5),
                                shape: const CircleBorder(),
                              ),
                            )
                          else
                            const SizedBox(width: 50),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
