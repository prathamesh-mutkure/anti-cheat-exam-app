import 'package:google_ml_vision/google_ml_vision.dart';

class FaceDetectionUtil {
  static Future<List<Face>> detectFromImagePath(String path) async {
    GoogleVisionImage visionImage = GoogleVisionImage.fromFilePath(path);

    final FaceDetector faceDetector = GoogleVision.instance.faceDetector();

    final List<Face> faces = await faceDetector.processImage(visionImage);

    return faces;
  }
}
