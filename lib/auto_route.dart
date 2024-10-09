import 'package:auto_route/auto_route.dart';
import 'package:guards/guards.dart';

/// {@template auto_route_extension_guard_base}
/// This extension is for converting your project's guards into
/// auto_route guards
/// {@endtemplate}
extension AutoRouteExtensionGuardBase on GuardBase {
  /// Converts your project's guard into an auto_route guard
  AutoRouteGuard toAutoRouteGuard() {

    return AutoRouteGuard.redirectPath(
      (navResolver) {
        print('isSatisfied: $isSatisfied');
        if (isSatisfied) {
          // null means guard is satisfied and navigation should continue
          return null;
        } else {
          print('Redirecting to $guardIdentifier');
          return redirectPath;
        }
      },
    );
  }
}
