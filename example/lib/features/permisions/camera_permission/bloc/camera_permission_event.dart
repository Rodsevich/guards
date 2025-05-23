part of 'camera_permission_bloc.dart';

sealed class CameraPermissionEvent extends Equatable {
  const CameraPermissionEvent();

  @override
  List<Object> get props => [];
}

final class CameraPermissionEventGrantPermission
    extends CameraPermissionEvent {}

final class CameraPermissionEventRevokePermission
    extends CameraPermissionEvent {}
