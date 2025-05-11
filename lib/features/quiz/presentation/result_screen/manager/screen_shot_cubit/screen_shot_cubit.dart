import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:vibration/vibration.dart';
import 'package:student_hackerha/features/quiz/presentation/result_screen/manager/screen_shot_cubit/screen_shot_state.dart';

class ScreenShotCubit extends Cubit<ScreenShotState> {
  ScreenShotCubit() : super(ScreenShotInitialState());

  final ScreenshotController controller = ScreenshotController();

  Future<void> takeScreenShotAndShare(BuildContext context) async {
    try {
      final Uint8List? image = await controller.capture();
      if (image == null) return;


      if (await Vibration.hasVibrator()) {
        Vibration.vibrate(duration: 100);
      }

      final tempDir = await getTemporaryDirectory();
      final imagePath = '${tempDir.path}/screenshot.png';
      final imageFile = File(imagePath);
      await imageFile.writeAsBytes(image);

      await Share.shareXFiles([XFile(imagePath)], text: 'هذه نتيجتي انا جحش');
    } catch (e) {
      print('حدث خطأ أثناء المشاركة: $e');
    }
  }
}
