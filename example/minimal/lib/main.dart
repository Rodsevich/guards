import 'package:flutter/material.dart';
import 'package:minimal/app/app.dart';
import 'package:minimal/core/guards/base.dart';
import 'package:minimal/core/guards/geolocation_permission_guard.dart';
import 'package:minimal/core/guards/gps_active_guard.dart';

late final MinimalExampleGuards minimalExampleGuards;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  minimalExampleGuards = MinimalExampleGuards(gpsActive: GuardGpsActive());

  await minimalExampleGuards.init();

  // if some of your guards require complex initialization or aren't
  // necessary for every user or workflow; don't delay the
  // app startup, just add them later when ready like this:
  minimalExampleGuards.addGuard(GuardGeolocationPermission());
  runApp(const GuardsMinimalExampleApp());
}
