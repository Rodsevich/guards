import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:guards/guards.dart';
import 'package:url_strategy/url_strategy.dart';

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
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  await Guards.init(
    persistenceStrategy: InMemoryPersistenceStrategy(),
    initialGuards: [],
  );

  setPathUrlStrategy();
  runApp(await builder());
}

class InMemoryPersistenceStrategy extends PersistenceDelegate {
  final Map<String, bool> _memory = {};

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
