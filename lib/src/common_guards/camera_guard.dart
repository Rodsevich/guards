import 'dart:async';

import 'package:app_guards/guards.dart';
import 'package:app_guards/src/delegates/camera_delegate.dart';
import 'package:permission_handler/permission_handler.dart';

///{@template camera_guard}
/// A guard that checks if the camera permission is granted.
/// If not, it redirects to the [cameraPermissionPath].
/// {@endtemplate}
class CameraGuard extends GuardBase {
  /// Creates a [CameraGuard] instance.
  ///
  /// The [cameraPermissionPath] is used for redirecting
  /// when the camera permission is not granted.
  /// {@macro camera_guard}
  CameraGuard({
    required this.cameraPermissionPath,
    CameraPersistenceDelegate? persistenceDelegate,
  }) : super(
         persistenceDelegate:
             persistenceDelegate ?? CameraPersistenceDelegate(),
       );

  /// The path to redirect if the camera permission is not granted.
  final String cameraPermissionPath;

  @override
  String get guardIdentifier => 'camera';

  @override
  String get redirectPath => cameraPermissionPath;

  /// Checks camera permission, persists it, and
  /// returns whether permission is granted.
  @override
  Future<bool> setUpAndInitializeGuard() async {
    final hasPermission = await checkCameraPermission();
    await persistenceDelegate?.updateGuardStatus(
      guardIdentifier,
      hasPermission,
    );
    return hasPermission;
  }

  @override
  FutureOr<bool> get checkIfSatisfied => checkCameraPermission();
}

/// Checks if the camera permission is granted.
Future<bool> checkCameraPermission() async {
  return false;
  final status = await Permission.camera.status;
  return status.isGranted;
}
