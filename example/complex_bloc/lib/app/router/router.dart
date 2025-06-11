import 'package:auto_route/auto_route.dart';
import 'package:guard_example/app/router/router.gr.dart';
import 'package:guard_example/core/guards/example_guard.dart';
import 'package:guard_example/features/home/view/home_page.dart';
import 'package:guard_example/features/login/signin/view/signin_page.dart';
import 'package:guard_example/features/login/signout/view/signout_page.dart';
import 'package:guard_example/features/login/view/login_page.dart';
import 'package:guard_example/features/permisions/camera_permission/view/camera_permission_page.dart';
import 'package:guard_example/features/take_photo/view/take_photo_page.dart';
import 'package:app_guards/auto_route.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  AppRouter(this.exampleGuards);

  final ExampleGuards exampleGuards;

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, initial: true, path: HomePage.path),
    AutoRoute(
      page: LoginRoute.page,
      path: LoginPage.path,
      children: [
        AutoRoute(page: SignInRoute.page, path: SignInPage.path),
        AutoRoute(page: SignoutRoute.page, path: SignoutPage.path),
      ],
    ),
    AutoRoute(
      page: CameraPermissionRoute.page,
      path: CameraPermissionPage.path,
    ),
    AutoRoute(
      page: TakePhotoRoute.page,
      path: TakePhotoPage.path,
      guards: [
        // exampleGuards.photographerPass.toAutoRouteGuard(),
        // exampleGuards.camera.toAutoRouteGuard(),
        exampleGuards.login.toAutoRouteGuardLocal(
          (GuardCallback gc) => LoginRoute(guardCallback: gc),
        ),
      ],
    ),
  ];
}
