import 'package:google_ml_vision/google_ml_vision.dart';

class FaceDetectionUtil {
  static FaceDetector? faceDetector;

  static initialize() {
    faceDetector = GoogleVision.instance.faceDetector();
  }

  static close() async {
    await faceDetector!.close();
  }

  static Future<List<Face>> detectFromImagePath(String path) async {
    GoogleVisionImage visionImage = GoogleVisionImage.fromFilePath(path);

    final List<Face> faces = await faceDetector!.processImage(visionImage);

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
}
