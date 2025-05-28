import 'dart:async';

import 'package:app_guards/guards.dart';
import 'package:geolocator/geolocator.dart';

class GuardGeolocationPermission extends GuardBase {
  GuardGeolocationPermission() : super(persistenceDelegate: null);

  @override
  Future<bool> get checkIfSatisfied async {
    final permission = await Geolocator.checkPermission();
    return permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;
  }

  @override
  String get guardIdentifier => 'geolocation_permission';

  @override
  String get redirectPath => 'goelocation_disallowed';

  @override
  Future<bool> setUpAndInitializeGuard() {
    return checkIfSatisfied;
  }
}
