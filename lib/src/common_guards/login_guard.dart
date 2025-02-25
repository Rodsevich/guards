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

  /// The path to redirect if the user is not logged in.
  @override
  String get guardIdentifier => 'login';

  /// The path to redirect if the user is not logged in.
  @override
  String get redirectPath => loginPath;

  /// Checks if the user is logged in, persists it, and returns whether the user
  /// is logged in.
  @override
  Future<bool> setUpAndInitializeGuard() async {
    final isLoggedIn = await _simulateLoginCheck();
    await persistenceDelegate!.updateGuardStatus(guardIdentifier, isLoggedIn);
    return isLoggedIn;
  }
  /// Simulates a login check.
  Future<bool> _simulateLoginCheck() async {
    return false;
  }
}
