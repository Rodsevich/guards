import 'package:guards/src/delegates/persistence_delegate.dart';

///{@template camera_persistence_delegate}
/// A mock of a custom delegate that mocks a camera permission.
/// {@endtemplate}
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
