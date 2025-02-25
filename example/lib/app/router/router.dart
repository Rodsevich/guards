import 'package:auto_route/auto_route.dart';
import 'package:guard_example/app/router/router.gr.dart';
import 'package:guard_example/core/guards/example_guard.dart';
import 'package:guards/auto_route.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  AppRouter(this.exampleGuards);

  final ExampleGuards exampleGuards;

  @override
  List<AutoRoute> get routes => [
//TODO: cambia los paths a un static const en los pages en todos lados
        AutoRoute(page: HomeRoute.page, initial: true, path: '/home'),
        AutoRoute(
          page: LoginRoute.page,
          path: '/login',
          children: [
            AutoRoute(page: SignInRoute.page, path: 'signin'),
            AutoRoute(page: SignoutRoute.page, path: 'signout'),
          ],
        ),
        AutoRoute(page: CameraPermissionRoute.page, path: '/permission/camera'),
        AutoRoute(
          page: TakePhotoRoute.page,
          path: '/take-photo',
          guards: [
            exampleGuards.login.toAutoRouteGuard(),
            exampleGuards.camera.toAutoRouteGuard(),
          ],
        ),
      ];
}
