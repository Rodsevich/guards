import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:guard_example/bootstrap.dart';

part 'camera_permission_event.dart';
part 'camera_permission_state.dart';

class CameraPermissionBloc
    extends Bloc<CameraPermissionEvent, CameraPermissionState> {
  CameraPermissionBloc() : super(const CameraPermissionState()) {
    on<CameraPermissionEventGrantPermission>((event, emit) async {
      await exampleGuards.camera.update(isSatisfied: true);
      emit(const CameraPermissionState());
      emit(const CameraPermissionStateGranted());
    });
    on<CameraPermissionEventRevokePermission>((event, emit) async{
      await exampleGuards.camera.update(isSatisfied: false);
      emit(const CameraPermissionState());
      emit(const CameraPermissionStateRevoked());
    });
  }
}
