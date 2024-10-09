import 'package:guard_example/guards/base.dart';
import 'package:guard_example/guards/camera.dart';
import 'package:guard_example/guards/login.dart';
import 'package:guards/guards.dart';

class ExampleGuards extends Guards<ExampleGuard> with _$ExampleGuards {
  ExampleGuards(
      {
    required super.persistenceDelegate,
    required super.initialGuards,
  });
}

//TODO(Nico): exatraer a un generador
mixin _$ExampleGuards on Guards<ExampleGuard> {
  GuardCameraPermission get camera => getGuardByGuardIdentifier('camera');
  GuardLogin get login => getGuardByGuardIdentifier('login');
}
