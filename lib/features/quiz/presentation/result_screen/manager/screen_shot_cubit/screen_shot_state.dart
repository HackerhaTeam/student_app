
import 'dart:typed_data';

abstract class ScreenShotState {}

class ScreenShotInitialState extends ScreenShotState {}



class ScreenShotLoadingState extends ScreenShotState {}



class ScreenShotSucessState extends ScreenShotState {
  final Uint8List image;

  ScreenShotSucessState({required this.image});
}
