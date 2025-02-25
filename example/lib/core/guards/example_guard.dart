
import 'package:guard_example/features/login/view/login_page.dart';
import 'package:guard_example/features/permisions/camera_permission/view/camera_permission_page.dart';
import 'package:guards/guards.dart';

class ExampleGuards extends Guards<GuardBase> with _$ExampleGuards {
  ExampleGuards({
    required super.persistenceDelegate,
    required super.initialGuards,
  });
}

// TODO(Nico): exatraer a un generador
mixin _$ExampleGuards on Guards<GuardBase> {
  CameraGuard get camera => getGuardByGuardIdentifier(
        CameraGuard(cameraPermissionPath: CameraPermissionPage.path)
            .guardIdentifier,
      );
  LoginGuard get login => getGuardByGuardIdentifier(
        LoginGuard(loginPath: LoginPage.path).guardIdentifier,
      );
}
