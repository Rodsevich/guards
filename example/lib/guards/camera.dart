import 'package:guard_example/guards/base.dart';

final class CameraLogin extends ExampleGuard {
  @override
  String get guardIdentifier => 'camera';

  @override
  Future<bool> setUpAndInitializeGuard() {
    // return DevicePermissions.hasCameraAccess();
    return Future.value(false);
  }
}
