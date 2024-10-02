import 'package:guard_example/guards/base.dart';

final class GuardLogin extends ExampleGuard {
  @override
  String get guardIdentifier => 'login';

  @override
  Future<bool> setUpAndInitializeGuard() {
    // If the access-token is valid and we are before due-date
    return Future.value(false);
  }
}
