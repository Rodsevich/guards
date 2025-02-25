import 'package:guard_example/core/guards/base.dart';
import 'package:guards/guards.dart';

final class CameraGuard extends ExampleGuard {
  CameraGuard() : super(persistenceDelegate: _CameraPersistenceDelegate());

  @override
  String get guardIdentifier => 'camera';

  @override
  String get redirectPath => '/permission/camera';

  @override
  Future<bool> setUpAndInitializeGuard() {
    // Aquí puedes reemplazar con una verificación real, por ejemplo:
    // return DevicePermissions.hasCameraAccess();
    return Future.value(false);
  }
}

class _CameraPersistenceDelegate extends PersistenceDelegate {
  static bool _hasPermission = false;

  @override
  Future<bool> checkGuardStatus(String guardName) async {
    return _hasPermission;
  }

  @override
  Future<void> updateGuardStatus(String guardName, bool value) async {
    _hasPermission = value;
  }
}
