import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:guards/guards.dart';

/// {@template auto_route_extension_guard_base}
/// This extension is for converting your project's guards into
/// auto_route guards
/// {@endtemplate}
extension AutoRouteExtensionGuardBase on GuardBase {
  /// Converts your project's guard into an auto_route guard
  AutoRouteGuard toAutoRouteGuard<T extends PageRouteInfo>(
    GuardedRouteGeneratingFunction<T> redirect,
  ) {
    return GuardsAutoRouteGuard(this, redirect);
    // return AutoRouteGuard.redirectPath(
    //   (navResolver) async {
    //     print('[${this.runtimeType}] isSatisfied: $checkIfSatisfied');
    //     if (await checkIfSatisfied) {
    //       // null means guard is satisfied and navigation should continue
    //       return null;
    //     } else {
    //       print('Redirecting to $guardIdentifier');
    //       return redirectPath;
    //     }
    //   },
    // );
  }
}

/// The function that will be used to generate the page that can satisfy
/// the guard when it's not satisfied and thus, activates the guard.
typedef GuardedRouteGeneratingFunction<T extends PageRouteInfo> =
    T Function(GuardCallback guardCallback);

final class GuardsAutoRouteGuard extends AutoRouteGuard {
  GuardsAutoRouteGuard(this.guard, this.redirect);

  final GuardBase guard;

  /// The PageInfo that will be used to redirect the user
  /// when the guard is not satisfied.
  final GuardedRouteGeneratingFunction redirect;

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    bool isSatisfied = await guard.checkIfSatisfied;
    if (isSatisfied) {
      resolver.next(true);
    } else {
      await resolver.redirectUntil(
        // NamedRoute(guard.redirectPath,
        //     //TODO(Nico): ver si dejar esto o no
        //     args: {
        //       'guardCallback': (bool isSatisfied) async {
        //         if (isSatisfied) {
        //           await guard.update(isSatisfied: true);
        //           resolver.next(true);
        //         } else {
        //           resolver.next(false);
        //         }
        //       }
        //     }
        redirect(({required bool isSatisfied}) async {
          if (isSatisfied) {
            await guard.update(isSatisfied: true);
            resolver.next(true);
          } else {
            resolver.next(false);
          }
        }),
        onFailure: (failure) {
          log('Guard failed with ${failure.runtimeType} error: $failure');
        },
      );
      // router.navigatePath(guard.redirectPath);
    }
  }
}

/// It is used to notify the guard that the user has satisfied the guard's requirements.
/// This callback is used to update the guard's state and continue navigation.
/// It is used in the [AutoRouteGuardSatisfyingPage] to notify the guard that the user has satisfied the guard's requirements.
/// It is also used in the [GuardsAutoRouteGuard] to notify the guard that the user has satisfied the guard's requirements.
typedef GuardCallback = Future<void> Function({required bool isSatisfied});

abstract class AutoRouteGuardSatisfyingPage extends StatelessWidget {
  const AutoRouteGuardSatisfyingPage({super.key, required this.guardCallback});

  /// The callback that will be called when the guard is satisfied.
  /// It will both update the guard, notify the router and continue navigation.
  final GuardCallback guardCallback;
}
