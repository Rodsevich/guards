import 'package:guard_example/guards/base.dart';

final class GuardCameraPermission extends ExampleGuard {
  @override
  String get guardIdentifier => 'camera';

  @override
  String get redirectPath => '/login';

  @override
  Future<bool> setUpAndInitializeGuard() {
    // return DevicePermissions.hasCameraAccess();
    return Future.value(false);
  }
}
