import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraScreen extends StatefulWidget {

  List<CameraDescription> cameras;

  CameraScreen(this.cameras);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {

  CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(
        widget.cameras[0],
        ResolutionPreset.medium,
    );
    controller.initialize().then((_) {
      if(!mounted) {
        return;
      }
      else{
        setState(() {

        });
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(!controller.value.isInitialized) {
      return Container();
    }
    else {
      return AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: CameraPreview(controller),
      );
    }
  }
}
