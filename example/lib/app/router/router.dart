import 'package:auto_route/auto_route.dart';
import 'package:guard_example/app/router/router.gr.dart';
import 'package:guard_example/guards/camera.dart';
import 'package:guards/guards.dart';

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
          path: '/camera',
          guards: [GuardCameraPermission().toAutoRouteGuard()],
        ),
      ];

  @override
  List<AutoRouteGuard> get guards =>
      Guards.guards.map((g) => g.toAutoRouteGuard()).toList();
}
