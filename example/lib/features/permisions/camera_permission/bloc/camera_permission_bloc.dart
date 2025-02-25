import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:guard_example/bootstrap.dart';

part 'camera_permission_event.dart';
part 'camera_permission_state.dart';

class CameraPermissionBloc
    extends Bloc<CameraPermissionEvent, CameraPermissionState> {
  CameraPermissionBloc() : super(const CameraPermissionState()) {
    on<CameraPermissionEventGrantPermission>((event, emit) {
      exampleGuards.camera.update(isSatisfied: true);
    });
    on<CameraPermissionEventRevokePermission>((event, emit) {
      exampleGuards.camera.update(isSatisfied: false);
    });
  }
}
