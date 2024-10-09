import 'package:guards/src/errors.dart';
import 'package:guards/src/persistence_delegate.dart';

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
  GuardBase();

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
  bool update({required bool isSatisfied}) {
    Guards._persistenceStrategy.updateGuardStatus(guardIdentifier, isSatisfied);
    this.isSatisfied = isSatisfied;
    return isSatisfied;
  }

  //TODO(Nico): meter el hash, el call y el toString
}

/// The guy in charge of your system-wide guards. Everything you should use for
/// guards should be here
class Guards {
  static late PersistenceDelegate _persistenceStrategy;

  static late List<GuardBase> guards;

  /// Call this function in your project's bootstrap. Ensure the guards defined
  /// here contains all the necessary for being setup, otherwise add them later
  /// with `addGuard`
  static Future<void> init({
    required PersistenceDelegate persistenceStrategy,
    required List<GuardBase> initialGuards,
  }) async {
    Guards._persistenceStrategy = persistenceStrategy;
    Guards.guards = initialGuards;
    for (final guard in Guards.guards) {
      guard.isSatisfied = await guard.setUpAndInitializeGuard();
    }
  }

  /// Call this when you are ready to add a guard that weren't able during
  /// bootstrap time.
  static Future<void> addGuard(GuardBase guard) async {
    guard.isSatisfied = await guard.setUpAndInitializeGuard();
    Guards.guards.add(guard);
  }

  /// The way of checking for guard statuses with the Guards system
  bool operator [](String guardIdentifier) {
    final guard = guards
        .where(
          (guard) => guard.guardIdentifier == guardIdentifier,
        )
        .singleOrNull;
    if (guard == null) throw NonExistentGuard(guardIdentifier);
    return guard.isSatisfied;
  }
}
