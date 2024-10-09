import 'package:auto_route/auto_route.dart';
import 'package:guard_example/app/router/router.gr.dart';
import 'package:guard_example/bootstrap.dart';
import 'package:guards/auto_route.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(
          page: LoginRoute.page,
          path: '/login',
          children: [
            AutoRoute(page: SignInRoute.page, path: 'signin'),
          ],
        ),
        AutoRoute(
          page: CameraRoute.page,
          path: '/permissions/camera',
          guards: [
            exampleGuards.login.toAutoRouteGuard(),
          ],
        ),
        AutoRoute(
          page: RestrictedRoute.page,
          guards: [
            exampleGuards.login.toAutoRouteGuard(),
            exampleGuards.camera.toAutoRouteGuard(),
          ],
        ),
      ];

  @override
  List<AutoRouteGuard> get guards => [
        // exampleGuards.login.toAutoRouteGuard(),
        // exampleGuards.camera.toAutoRouteGuard(),
      ];
}
