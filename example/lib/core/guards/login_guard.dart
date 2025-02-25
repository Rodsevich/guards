import 'dart:math';

import 'package:guard_example/core/guards/base.dart';
import 'package:guard_example/features/login/view/login_page.dart';
import 'package:guards/guards.dart';

final class LoginGuard extends ExampleGuard {
  LoginGuard() : super(persistenceDelegate: _LoginPersistenceDelegate());

  @override
  String get guardIdentifier => 'login';

  @override
  Future<bool> setUpAndInitializeGuard() {
    // If the access-token is valid and we are before due-date
    return Future.value(false);
  }

  @override
  String get redirectPath => LoginPage.path;
}

/// A mock of a custom delegate that mocks a JWT creation when login is
/// successful
class _LoginPersistenceDelegate extends PersistenceDelegate {
  static String _jwt = '';

  @override
  Future<bool> checkGuardStatus(String guardName) async {
    return _jwt.isNotEmpty;
  }

  @override
  Future<void> updateGuardStatus(String guardName, bool value) async {
    _jwt = value ? Random().nextInt(2000).toRadixString(36) : '';
  }
}
