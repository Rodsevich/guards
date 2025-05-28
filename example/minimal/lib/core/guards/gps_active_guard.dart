import 'dart:async';

import 'package:app_guards/guards.dart';
import 'package:geolocator/geolocator.dart';

class GuardGpsActive extends GuardBase {
  GuardGpsActive() : super(persistenceDelegate: null);

  @override
  Future<bool> get checkIfSatisfied => Geolocator.isLocationServiceEnabled();

  @override
  String get guardIdentifier => 'gps_active';

  @override
  String get redirectPath => 'gps_disabled';

  @override
  Future<bool> setUpAndInitializeGuard() {
    return checkIfSatisfied;
  }
}
