import 'dart:async';
import 'dart:developer';

import 'package:app_guards/guards.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:guard_example/core/guards/example_guard.dart';
import 'package:guard_example/core/guards/photographer_pass_guard.dart';
import 'package:guard_example/features/login/view/login_page.dart';
import 'package:guard_example/features/permissions/camera_permission/view/camera_permission_page.dart';
import 'package:url_strategy/url_strategy.dart';

late ExampleGuards exampleGuards;

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  exampleGuards = ExampleGuards(
    persistenceDelegate: InMemoryPersistenceDelegate(),
    initialGuards: [
      CameraGuard(cameraPermissionPath: CameraPermissionPage.path),
      LoginGuard(loginPath: LoginPage.path),
      PhotographerPassGuard(),
    ],
  );

  await exampleGuards.init();

  setPathUrlStrategy();
  runApp(await builder());
}

class InMemoryPersistenceDelegate extends PersistenceDelegate {
  static final Map<String, bool> _memory = {};

  @override
  Future<bool> checkGuardStatus(String guardName) async {
    if (_memory.containsKey(guardName)) {
      return _memory[guardName]!;
    } else {
      return false;
    }
  }

  @override
  Future<void> updateGuardStatus(String guardName, bool value) async {
    _memory[guardName] = value;
  }
}
