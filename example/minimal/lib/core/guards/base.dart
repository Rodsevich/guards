import 'package:app_guards/guards.dart';
import 'package:minimal/core/guards/geolocation_permission_guard.dart';
import 'package:minimal/core/guards/gps_active_guard.dart';

abstract base class MinimalExampleGuardBase extends GuardBase {
  MinimalExampleGuardBase() : super(persistenceDelegate: null);
}

class MinimalExampleGuards extends Guards {
  MinimalExampleGuards({required this.gpsActive})
    : super(persistenceDelegate: null, initialGuards: [gpsActive]);

  // define the guards you want to use in your app like this as much as
  // possible for simplicity and ease of use
  final GuardGpsActive gpsActive;

  // if for some reason you want to have a guard that can't be initialized
  // at the start of the app, you can use this technique instead
  GuardGeolocationPermission get geolocationPermission =>
      getGuardByGuardIdentifier('geolocation_permission');
}
