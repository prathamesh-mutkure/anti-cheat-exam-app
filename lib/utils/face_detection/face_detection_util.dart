import 'dart:io';

import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image/image.dart' as imglib;
import 'package:path_provider/path_provider.dart';

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
    // GoogleVisionImage visionImage = GoogleVisionImage.fromFilePath(path);
    InputImage inputImage = InputImage.fromFilePath(
      Platform.isIOS ? await _processImageOnIOS(path) : path,
    );

    final List<Face> faces = await faceDetector!.processImage(inputImage);

    return faces;
  }

  static bool detectCheating(Face face) {
    final double? rotY =
        face.headEulerAngleY; // Head is rotated to the right rotY degrees

    print('**************************');

    print(rotY);
    if (rotY! > 30 || rotY < -30) {
      print("CHEATING");
      print('**************************');
      return true;
    } else {
      print("NOT CHEATING");
      print('**************************');
      return false;
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
