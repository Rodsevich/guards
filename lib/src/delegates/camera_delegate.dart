import 'package:guards/src/delegates/persistence_delegate.dart';

/// Handles camera-specific persistence operations.
class CameraPersistenceDelegate extends PersistenceDelegate {
  static bool _hasPermission = false;

  /// Checks whether the camera guard is active.
  @override
  Future<bool> checkGuardStatus(String guardName) async {
    return _hasPermission;
  }

  /// Updates the camera permission.
  @override
  Future<void> updateGuardStatus(String guardName, bool value) async {
    _hasPermission = value;
  }
}
