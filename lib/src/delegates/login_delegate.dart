import 'dart:math';
import 'package:guards/guards.dart';

///{@template login__percistence_delegate}
/// A mock of a custom delegate that mocks a JWT creation when login is
/// successful.
/// {@endtemplate}
class LoginPersistenceDelegate extends PersistenceDelegate {
  /// The JWT token.
  static String _token = '';

  /// Checks whether the login guard is active.
  @override
  Future<bool> checkGuardStatus(String guardName) async {
    return _token.isNotEmpty;
  }
  /// Updates the login status.
  @override
  Future<void> updateGuardStatus(String guardName, bool value) async {
    if (value) {
      _token = _generateToken();
    } else {
      _token = '';
    }
  }
  /// Generates a random token.
  String _generateToken() {
    return Random().nextInt(1000000).toRadixString(36);
  }
}
