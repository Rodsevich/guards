import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:guards/src/delegates/persistence_delegate.dart';
import 'package:guards/src/errors.dart';

part 'guard_base.dart';
part 'guard_status_change.dart';

/// The guy in charge of your system-wide guards. Everything you should use for
/// guards should be here
class Guards<T extends GuardBase> {
  /// The guy in charge of your system-wide guards. Everything you should use for
  /// guards should be here
  Guards({required this.persistenceDelegate, required List<T> initialGuards})
    : guards = initialGuards;

  static final _controller = StreamController<GuardsStatusChange>.broadcast();

  /// The delegate that will be used for checking the guards in memory, leave
  /// it null if you want the guards to be checked on demand, always
  PersistenceDelegate? persistenceDelegate;

  /// The list of guards that will be checked for the system
  List<T> guards;

  /// Call this function in your project's bootstrap. Ensure the guards defined
  /// here contains all the necessary for being setup, otherwise add them later
  /// with `addGuard`
  Future<void> init() async {
    await Future.wait(guards.map(_setUpGuard));
  }

  /// Call this when you are ready to add a guard that weren't able during
  /// bootstrap time.
  Future<void> addGuard(T guard) async {
    guards.add(guard);
    await _setUpGuard(guard);
  }

  Future<bool> _setUpGuard(GuardBase guard) async {
    final initialValue = await guard.setUpAndInitializeGuard();
    guard
      .._parentGuardSystem = this
      ..persistenceDelegate ??= persistenceDelegate
      .._currentStatus = initialValue
      ..changeNotifier.listen(_notifyChanges);
    return guard.update(isSatisfied: initialValue);
  }

  void _notifyChanges(_) {
    final guardsStatus = Map.fromEntries(
      guards.map((guard) => MapEntry(guard, guard.currentStatus)),
    );
    _controller.add(GuardsStatusChange(guardsStatus));
  }

  /// The way of obtaining guard through its identifier
  R getGuardByGuardIdentifier<R extends T>(String identifier) {
    final guard = guards
        .where((guard) => guard.guardIdentifier == identifier)
        .singleOrNull;
    if (guard == null) throw NonExistentGuard(identifier);
    return guard as R;
  }

  /// Define this in your App's routerConfig's reevaluateListenable
  Stream<GuardsStatusChange> get guardListenableStream =>
      _controller.stream.distinct();
}
