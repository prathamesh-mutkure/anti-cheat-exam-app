import 'dart:io';

import 'package:anti_cheat_exam_app/models/exam/Exam.dart';
import 'package:anti_cheat_exam_app/stores/exam/exam_store.dart';
import 'package:anti_cheat_exam_app/utils/app/app_utils.dart';
import 'package:anti_cheat_exam_app/utils/face_detection/face_detection_util.dart';
import 'package:anti_cheat_exam_app/widgets/exam/exam_buttons.dart';
import 'package:anti_cheat_exam_app/widgets/exam/exam_timer.dart';
import 'package:anti_cheat_exam_app/widgets/exam/exam_warning_alert.dart';
import 'package:anti_cheat_exam_app/widgets/exam/question_button.dart';
import 'package:anti_cheat_exam_app/widgets/exam/question_widget.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_vision/google_ml_vision.dart';
import 'package:provider/provider.dart';
import 'package:timer_count_down/timer_controller.dart';

// TODO: Video Monitoring
// TODO: AI with Google ML Kit
// TODO: Video Call Online
// TODO: Timer
// TODO: Exam Assessment
// TODO: Disable Screenshot

class ExamPage extends StatefulWidget {
  @override
  _ExamPageState createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> with WidgetsBindingObserver {
  Exam? exam;
  CountdownController? _countdownController;

  List<CameraDescription>? _cameras;
  CameraController? _cameraController;
  Future<void>? _initializeControllerFuture;
  XFile? lastImage;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    initCameras();
    FaceDetectionUtil.initialize();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    _cameraController!.dispose();
    FaceDetectionUtil.close();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed &&
        !context.read<ExamStore>().didLeaveExam) {
      context.read<ExamStore>().didLeaveExam = true;

      _countdownController!.pause();

      // TODO: Set barrierDismissible false
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (_) => ExamWarningAlert(),
      ).then((value) {
        context.read<ExamStore>().didLeaveExam = false;
        ++context.read<ExamStore>().leaveExamCount;
        _countdownController!.resume();
      });
    }
  }

  Future<void> initCameras() async {
    _cameras = await availableCameras();
    _cameraController = CameraController(_cameras![1], ResolutionPreset.medium);

    _initializeControllerFuture = _cameraController!.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    exam = context.watch<ExamStore>().currentExam;
    _countdownController = context.read<ExamStore>().countdownController;

    // TODO: Set onWillPop false
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.camera_alt),
          onPressed: _onPictureClicked,
        ),
        appBar: _buildAppBar(),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                QuestionWidget(),
                _buildQuestionNavigationButtons(),
                SizedBox(height: 50),
                _buildQuestionButtons(),
                SizedBox(height: 35),
                _buildVideoSection(),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: Text(exam!.name),
      actions: [
        ExamTimer(),
      ],
    );
  }

  _buildQuestionNavigationButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ExamButton(
          text: "PREVIOUS",
          onPressed: () {
            context.read<ExamStore>().goToPreviousQuestion();
          },
        ),
        SizedBox(width: 20),
        ExamButton(
          text: "NEXT",
          onPressed: () {
            context.read<ExamStore>().goToNextQuestion();
          },
        ),
        // TODO: For Testing, remove during actual app
        SizedBox(width: 20),
        ExamButton(
          text: "AI",
          onPressed: () {
            _onAITapped();
          },
        ),
      ],
    );
  }

  _buildQuestionButtons() {
    return GridView.count(
      crossAxisCount: 5,
      shrinkWrap: true,
      padding: EdgeInsets.all(2),
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      physics: NeverScrollableScrollPhysics(),
      children: () {
        List<Widget> widgets = [];

        for (int i = 0; i < exam!.questions!.length; i++) {
          widgets.add(QuestionButton(questionNo: i));
        }

        return widgets;
      }(),
    );
  }

  _buildCameraStream() {
    return FutureBuilder<void>(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // If the Future is complete, display the preview.
          return Container(
            padding: EdgeInsets.all(6),
            child: CameraPreview(_cameraController!),
          );
        } else {
          // Otherwise, display a loading indicator.
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  _buildImage() {
    return Container(
      padding: EdgeInsets.all(6),
      child:
          lastImage != null ? Image.file(File(lastImage!.path)) : Container(),
    );
  }

  _buildVideoSection() {
    return Row(
      children: [
        Expanded(
          child: _buildCameraStream(),
        ),
        Expanded(
          child: _buildImage(),
          // child: Container(),
        ),
      ],
    );
  }

  _onPictureClicked() async {
    try {
      await _initializeControllerFuture;
      lastImage = await _cameraController!.takePicture();
      setState(() {});
    } catch (e) {
      AppUtils.showToast(e.toString());
    }
  }

  _onAITapped() async {
    if (lastImage == null) return;

    List<Face> faces =
        await FaceDetectionUtil.detectFromImagePath(lastImage!.path);

    final bool isCheating = FaceDetectionUtil.detectCheating(faces[0]);

    if (isCheating) {
      AppUtils.showToast("CHEATING DETECTED");
    }
  }
}
