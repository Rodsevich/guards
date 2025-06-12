import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:app_guards/guards.dart';

/// {@template auto_route_extension_guard_base}
/// This extension is for converting your project's guards into
/// auto_route guards
/// {@endtemplate}
extension AutoRouteExtensionGuardBase on GuardBase {
  /// Converts your project's guard into an auto_route guard pretended to be
  /// used in the router's route definition, _locally_ to that route.
  AutoRouteGuard toAutoRouteGuardLocal<T extends PageRouteInfo>(
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

  /// Converts your project's guard into an auto_route guard pretended to be
  /// used in the router's guards getter, _globally_ to the whole router
  AutoRouteGuard toAutoRouteGuardGlobal<T extends PageRouteInfo>(
    GuardedRouteGeneratingFunction<T> redirect,
  ) {
    return GuardsAutoRouteGuard(this, redirect);
    //   AutoRouteGuard.simple((resolver, router) {
    //       if(isAuthenticated || resolver.routeName == LoginRoute.name) {
    //         // we continue navigation
    //         resolver.next();
    //       } else {
    //         // else we navigate to the Login page so we get authenticated

    //         // tip: use resolver.redirectUntil to have the redirected route
    //         // automatically removed from the stack when the resolver is completed
    //         resolver.redirectUntil(LoginRoute(onResult: (didLogin) => resolver.next(didLogin)));
    //       }
    //     },
    //   ),
    //   // add more guards here
    // ];
  }
}

/// The function that will be used to generate the page that can satisfy
/// the guard when it's not satisfied and thus, activates the guard.
typedef GuardedRouteGeneratingFunction<T extends PageRouteInfo> =
    T Function(GuardCallback guardCallback);

final class GuardsAutoRouteGuard extends AutoRouteGuard {
  GuardsAutoRouteGuard(this.guard, this.redirectRoute);

  final GuardBase guard;

  /// The PageInfo that will be used to redirect the user
  /// when the guard is not satisfied.
  final GuardedRouteGeneratingFunction redirectRoute;

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    final isSatisfied = await guard.checkIfSatisfied;
    if (isSatisfied) {
      if (false == resolver.isResolved) resolver.next();
    } else {
      await resolver.redirectUntil(
        redirectRoute(({required bool isSatisfied}) async {
          if (isSatisfied) {
            await guard.update(isSatisfied: true);
            resolver.next();
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

/// It is used to notify the guard that the user has satisfied the guard's
/// requirements.
/// This callback is used to update the guard's state and continue navigation.
/// It is used in the [AutoRouteGuardSatisfyingPage] to notify the guard
/// that the user has satisfied the guard's requirements.
/// It is also used in the [GuardsAutoRouteGuard] to notify the guard that the
/// user has satisfied the guard's requirements.
typedef GuardCallback = Future<void> Function({required bool isSatisfied});

/// A handy widget for ensuring a guard can be satisfied through the page the
/// widget draws.
abstract class AutoRouteGuardSatisfyingPage extends StatelessWidget {
  const AutoRouteGuardSatisfyingPage({required this.guardCallback, super.key});

  /// The callback that will be called when the guard is satisfied.
  /// It will both update the guard, notify the router and continue navigation.
  final GuardCallback guardCallback;
}
