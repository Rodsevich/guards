import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:guard_example/bootstrap.dart';

part 'camera_event.dart';
part 'camera_state.dart';

class CameraBloc extends Bloc<CameraEvent, CameraState> {
  CameraBloc() : super(const CameraState()) {
    on<CameraEventGrantPermission>((event, emit) {
      guards.camera.update(isSatisfied: true);
    });
    on<CameraEventRevokePermission>((event, emit) {
      guards.camera.update(isSatisfied: false);
    });
  }
}
