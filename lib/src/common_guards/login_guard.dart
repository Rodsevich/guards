import 'package:guards/guards.dart';
import 'package:guards/src/delegates/login_delegate.dart';

/// {@template login_guard}
/// A guard that checks if the user is logged in.
/// If not, it redirects to the [loginPath].
/// {@endtemplate}
final class LoginGuard extends GuardBase {
  /// {@macro login_guard}
  LoginGuard({required this.loginPath})
      : super(persistenceDelegate: LoginPersistenceDelegate());
  /// Creates a [LoginGuard] instance.
  final String loginPath;

  @override
  String get guardIdentifier => 'login';

  @override
  String get redirectPath => loginPath;

  @override
  Future<bool> setUpAndInitializeGuard() async {
    final isLoggedIn = await _simulateLoginCheck();
    await persistenceDelegate!.updateGuardStatus(guardIdentifier, isLoggedIn);
    return isLoggedIn;
  }

  Future<bool> _simulateLoginCheck() async {
    return false;
  }
}