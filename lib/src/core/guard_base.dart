part of 'guards.dart';

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

  /// The delegate that will be used for checking the guards. If null here, the
  /// guard system will provide the persistence delegate it has, that can also
  /// be null; in which case the guard will not persist its status.
  PersistenceDelegate? persistenceDelegate;

  /// Leave visible for eventual interaction with sibling guards or custom/complex
  /// interactions in the `update` method.
  Guards get parentGuardSystem => _parentGuardSystem;

  late final Guards _parentGuardSystem;

  /// Use this for notifying for changes in this guard.
  final StreamController<bool> _notifier = StreamController<bool>.broadcast();

  /// A stream that could be listened to for changes in the guard's status.
  /// This stream will emit new values only when the guard's status _changes_,
  /// i.e., when the value emitted is different from the previous one.
  Stream<bool> get changeNotifier => _notifier.stream;

  /// Define the necessary for the guard to work. The return value must declare
  /// whether the guard is satisfied or not according to that setup
  Future<bool> setUpAndInitializeGuard();

  /// A key for identifying this guard in a key-value way
  String get guardIdentifier;

  /// The path to redirect if the guard is not satisfied
  String get redirectPath;

  /// The function to override for indicating if the guard is satisfied or not.
  FutureOr<bool> get checkIfSatisfied;

  /// The current status of the guard, whether it is satisfied or not.
  bool get currentStatus => _currentStatus;

  bool _currentStatus = false;

  /// Call this function if you want to update the guard's status.
  /// This will also update the persistence delegate if it is not null.
  @mustCallSuper
  Future<bool> update({required bool isSatisfied}) async {
    _notifier.add(isSatisfied);
    if (isSatisfied == _currentStatus) {
      return _currentStatus; // No change, return current status
    }
    _currentStatus = isSatisfied;
    if (persistenceDelegate != null) {
      await persistenceDelegate!.updateGuardStatus(
        guardIdentifier,
        isSatisfied,
      );
    }
    return isSatisfied;
  }

  @override
  String toString() {
    return 'Guard:$guardIdentifier($_currentStatus)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GuardBase && other.guardIdentifier == guardIdentifier;
  }

  @override
  int get hashCode => guardIdentifier.hashCode;
}
