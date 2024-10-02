/// The guy in charge of persisting the status of the guards
abstract class PersistenceDelegate {
  /// Checks in memory if the guard is satisfied.
  Future<bool> checkGuardStatus(String guardName);

  /// Updates in memory if the guard is satisfied or not
  // ignore: avoid_positional_boolean_parameters
  Future<void> updateGuardStatus(String guardName, bool value);
}
