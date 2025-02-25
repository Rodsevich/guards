part of 'camera_permission_bloc.dart';

class CameraPermissionState extends Equatable {
  const CameraPermissionState();

  @override
  List<Object> get props => [];
}
final class CameraPermissionStateGranted extends CameraPermissionState {
  const CameraPermissionStateGranted();
}

final class CameraPermissionStateRevoked extends CameraPermissionState {
  const CameraPermissionStateRevoked();
}