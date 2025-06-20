import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:all_project/Viewmodel/widgets/checkinandoutwidget.dart';

class Cameracheckout extends StatefulWidget {
   Cameracheckout({super.key});

  @override
  State<Cameracheckout> createState() => _CameracheckoutState();
}

class _CameracheckoutState extends State<Cameracheckout> {
  CameraController? _cameraController;
  bool _isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final frontCamera = cameras.firstWhere(
      (camera) => camera.lensDirection == CameraLensDirection.front,
    );

    _cameraController = CameraController(
      frontCamera,
      ResolutionPreset.medium,
      enableAudio: false,
    );

    await _cameraController!.initialize();
    setState(() {
      _isCameraInitialized = true;
    });
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _isCameraInitialized
          ? Column(
              children: [
                // 👇 CameraPreview is active but invisible
                Opacity(
                  opacity: 0,
                  child: SizedBox(
                    height: 600,
                    width: double.infinity,
                    child: CameraPreview(_cameraController!),
                  ),
                ),
                 SizedBox(height: 16),
                cameraheading(
                  "Center your face",
                  "Point your face right at the box then take a photo",
                  "then take a photo",
                ),
                 SizedBox(height: 50),
                customchekout(context)
              ],
            )
          :  Center(child: CircularProgressIndicator()),
    );
  }
}