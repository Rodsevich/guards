import 'package:flutter/foundation.dart';
import 'package:guards/guards.dart';
import 'package:guards/src/delegates/camera_delegate.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:universal_html/html.dart' as html;

///{@template camera_guard}
/// A guard that checks if the camera permission is granted.
/// If not, it redirects to the [cameraPermissionPath].
/// {@endtemplate}
final class CameraGuard extends GuardBase {
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
                persistenceDelegate ?? CameraPersistenceDelegate(),);

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
        guardIdentifier, hasPermission,);
    return hasPermission;
  }
}

/// Checks if the camera permission is granted.
Future<bool> checkCameraPermission() async {
  if (kIsWeb) {
    try {
      /// Checks if the camera is accessible.
      await html.window.navigator.getUserMedia(video: true);
      return true;
    } catch (e) {
      return false;
    }
  } else {
    final status = await Permission.camera.status;
    return status.isGranted;
  }
}
