import 'package:auto_route/auto_route.dart';
import 'package:guard_example/app/router/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: CameraRoute.page),
      ];

  @override
  List<AutoRouteGuard> get guards => super.guards;
}
