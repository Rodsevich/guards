import 'package:auto_route/auto_route.dart';
import 'package:guards/auto_route.dart';
import 'package:minimal/app/router/router.gr.dart';
import 'package:minimal/core/guards/base.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  AppRouter(this.exampleGuards);

  final MinimalExampleGuards exampleGuards;

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: RouteHome.page,
      initial: true,
      path: '/',
      guards: [
        exampleGuards.gpsActive.toAutoRouteGuard(
          (GuardCallback gc) => RouteGpsNotActiveGuard(),
        ),
        exampleGuards.geolocationPermission.toAutoRouteGuard(
          (GuardCallback gc) => RouteGeolocationPermissionGuard(),
        ),
      ],
    ),
    //Guards
    AutoRoute(page: RouteGpsNotActiveGuard.page),
    AutoRoute(page: RouteGeolocationPermissionGuard.page),
  ];
}
