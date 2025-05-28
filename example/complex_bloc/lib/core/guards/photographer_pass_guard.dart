import 'dart:async';

import 'package:app_guards/guards.dart';

//TODO: Agregar esta guarda
class PhotographerPassGuard extends GuardBase {
  PhotographerPassGuard() : super(persistenceDelegate: null);

  bool isPhotographer = false;

  @override
  FutureOr<bool> get checkIfSatisfied => isPhotographer;

  @override
  String get guardIdentifier => 'photographer_pass';

  @override
  String get redirectPath => '/permissions/photographer_pass';

  @override
  Future<bool> setUpAndInitializeGuard() async {
    return false;
  }
}
