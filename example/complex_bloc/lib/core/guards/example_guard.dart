import 'package:guard_example/core/guards/photographer_pass_guard.dart';
import 'package:app_guards/guards.dart';

class ExampleGuards extends Guards<GuardBase> with _$ExampleGuards {
  ExampleGuards({
    required super.persistenceDelegate,
    required super.initialGuards,
  });
}

// TODO(Nico): extraer a un generador
mixin _$ExampleGuards on Guards<GuardBase> {
  CameraGuard get camera => getGuardByGuardIdentifier('camera');
  LoginGuard get login => getGuardByGuardIdentifier('login');
  PhotographerPassGuard get photographerPass =>
      getGuardByGuardIdentifier('photographer_pass');
}
