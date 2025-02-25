import 'package:guard_example/core/guards/base.dart';
import 'package:guard_example/core/guards/camera_guard.dart';
import 'package:guard_example/core/guards/login_guard.dart';
import 'package:guards/guards.dart';

class ExampleGuards extends Guards<ExampleGuard> with _$ExampleGuards {
  ExampleGuards({
    required super.persistenceDelegate,
    required super.initialGuards,
  });
}

// TODO(Nico): exatraer a un generador
mixin _$ExampleGuards on Guards<ExampleGuard> {
  CameraGuard get camera => getGuardByGuardIdentifier(CameraGuard().guardIdentifier);
  LoginGuard get login => getGuardByGuardIdentifier(LoginGuard().guardIdentifier);
}
