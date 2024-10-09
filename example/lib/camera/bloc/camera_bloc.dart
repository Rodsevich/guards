import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:guard_example/guards/camera.dart';
import 'package:guards/guards.dart';

part 'camera_event.dart';
part 'camera_state.dart';

class CameraBloc extends Bloc<CameraEvent, CameraState> {
  CameraBloc() : super(const CameraState()) {
    on<CameraEventGrantPermission>((event, emit) {
      Guards[GuardCameraPermission() as GuardBase];
    });
  }
}
