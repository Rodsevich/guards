import 'dart:async';

import 'package:guards/src/errors.dart';
import 'package:guards/src/delegates/persistence_delegate.dart';

/// {@template guard}
/// The parent class for every guard of your guard system.
/// Extend this on an base parent class with the name of your
/// project prefixed.
///
/// ```dart
/// base MyProjectGuard extends GuardBase {
/// }
///
/// final GuardLogin extends MyProjectGuard{}
///
/// final GuardCamera extends MyProjectGuard{}
/// ```
/// {@endtemplate}
abstract class GuardBase {
  /// {@macro guards}
  GuardBase({required this.persistenceDelegate});

  PersistenceDelegate? persistenceDelegate;

  late StreamSink<GuardStatusChange> _reevaluateStream;

  /// Define the necessary for the guard to work. The return value should state
  /// whether the guard is satisfied or not according to that setup
  Future<bool> setUpAndInitializeGuard();

  /// A key for identifying this guard in a key-value way
  String get guardIdentifier;

  /// The path to redirect if the guard is not satisfied
  String get redirectPath;

  /// The in-memory place for saving if the guard is granted or not. It should be updated with
  /// `update` method
  bool isSatisfied = false;

  ///
  Future<bool> update({required bool isSatisfied}) async {
    await persistenceDelegate!.updateGuardStatus(guardIdentifier, isSatisfied);
    this.isSatisfied = isSatisfied;
    _reevaluateStream.add(GuardStatusChange(this, isSatisfied));
    return isSatisfied;
  }

  //TODO(Nico): meter el hash, el call y el toString
}

class GuardStatusChange {
  const GuardStatusChange(this.guard, this.isSatisfied);

  final GuardBase guard;
  final bool isSatisfied;
}

/// The guy in charge of your system-wide guards. Everything you should use for
/// guards should be here
abstract class Guards<T extends GuardBase> {
  /// The guy in charge of your system-wide guards. Everything you should use for
  /// guards should be here
  Guards({
    required this.persistenceDelegate,
    required List<GuardBase> initialGuards,
  }) : guards = initialGuards;

  static final _controller = StreamController<GuardStatusChange>();

  PersistenceDelegate persistenceDelegate;

  List<GuardBase> guards;

  /// Call this function in your project's bootstrap. Ensure the guards defined
  /// here contains all the necessary for being setup, otherwise add them later
  /// with `addGuard`
  Future<void> init() async {
    for (final guard in guards) {
      guard.isSatisfied = await _setUpGuard(guard);
    }
  }

  Future<bool> _setUpGuard(GuardBase guard) {
    guard._reevaluateStream = _controller.sink;
    return guard.setUpAndInitializeGuard();
  }

  /// Call this when you are ready to add a guard that weren't able during
  /// bootstrap time.
  Future<void> addGuard(GuardBase guard) async {
    guard.persistenceDelegate ??= persistenceDelegate;
    guard.isSatisfied = await _setUpGuard(guard);
    guards.add(guard);
  }

  /// The way of checking for a guard through its identifier
  R getGuardByGuardIdentifier<R extends T>(String identifier) {
    final guard = guards
        .where(
          (guard) => guard.guardIdentifier == identifier,
        )
        .singleOrNull;
    if (guard == null) throw NonExistentGuard(identifier);
    return guard as R;
  }

  /// Define this in your App's routerConfig's reevaluateListenable
  Stream<GuardStatusChange> get guardListenableStream => _controller.stream;
}
