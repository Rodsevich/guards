part of 'camera_bloc.dart';

sealed class CameraEvent extends Equatable {
  const CameraEvent();

  @override
  List<Object> get props => [];
}

final class CameraEventGrantPermission extends CameraEvent {}

final class CameraEventRevokePermission extends CameraEvent {}
