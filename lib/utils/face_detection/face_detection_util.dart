import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image/image.dart' as imglib;
import 'package:path_provider/path_provider.dart';

enum CheatingStatus {
  Detected,
  NotDetected,
  NoFace,
}

class FaceDetectionUtil {
  static FaceDetector? faceDetector;

  static initialize() {
    // faceDetector = GoogleVision.instance.faceDetector();
    final options = FaceDetectorOptions();
    faceDetector = FaceDetector(options: options);
  }

  static close() async {
    await faceDetector?.close();
  }

  static Future<List<Face>> detectFromImagePath(String path) async {
    InputImage inputImage = InputImage.fromFilePath(
      Platform.isIOS ? await _processImageOnIOS(path) : path,
    );

    try {
      final List<Face> faces = await faceDetector!.processImage(inputImage);

      return faces;
    } catch (e) {
      debugPrint("Error detecting faces: $e");

      return [];
    }
  }

  static CheatingStatus detectCheating(Face? face) {
    if (face == null) return CheatingStatus.NoFace;

    final double? rotY =
        face.headEulerAngleY; // Head is rotated to the right rotY degrees

    print('**************************');

    print(rotY);
    if (rotY! > 30 || rotY < -30) {
      print("CHEATING");
      print('**************************');
      return CheatingStatus.Detected;
    } else {
      print("NOT CHEATING");
      print('**************************');
      return CheatingStatus.NotDetected;
    }
  }

  static printFaces(List<Face> faces) {
    for (Face face in faces) {
      final double? rotY =
          face.headEulerAngleY; // Head is rotated to the right rotY degrees
      final double? rotZ =
          face.headEulerAngleZ; // Head is tilted sideways rotZ degrees

      print('-------------------------------');
      print('$rotY ----- $rotZ');
      print('-------------------------------');
    }
  }

  static Future<String> _processImageOnIOS(String path) async {
    if (Platform.isIOS) {
      final directory = await getApplicationDocumentsDirectory();
      final filename = DateTime.now().millisecondsSinceEpoch.toString();

      final imglib.Image capturedImage =
          imglib.decodeImage(await File(path).readAsBytes())!;

      final imglib.Image orientedImage = imglib.bakeOrientation(capturedImage);

      final imageToBeProcessed = await File('${directory.path}/$filename')
          .writeAsBytes(imglib.encodeJpg(orientedImage));

      return imageToBeProcessed.path;
    }

    return path;
  }
}
