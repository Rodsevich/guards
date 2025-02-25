// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:guard_example/features/home/view/home_page.dart' as _i2;
import 'package:guard_example/features/login/signin/view/signin_page.dart'
    as _i5;
import 'package:guard_example/features/login/signout/view/signout_page.dart'
    as _i6;
import 'package:guard_example/features/login/view/login_page.dart' as _i3;
import 'package:guard_example/features/permisions/camera_permission/view/camera_permission_page.dart'
    as _i1;
import 'package:guard_example/features/restricted/view/restricted_page.dart'
    as _i4;
import 'package:guard_example/features/take_photo/view/take_photo_page.dart'
    as _i7;

/// generated route for
/// [_i1.CameraPermissionPage]
class CameraPermissionRoute extends _i8.PageRouteInfo<void> {
  const CameraPermissionRoute({List<_i8.PageRouteInfo>? children})
      : super(CameraPermissionRoute.name, initialChildren: children);

  static const String name = 'CameraPermissionRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i1.CameraPermissionPage();
    },
  );
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
      : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomePage();
    },
  );
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute({List<_i8.PageRouteInfo>? children})
      : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i3.LoginPage();
    },
  );
}

/// generated route for
/// [_i4.RestrictedPage]
class RestrictedRoute extends _i8.PageRouteInfo<void> {
  const RestrictedRoute({List<_i8.PageRouteInfo>? children})
      : super(RestrictedRoute.name, initialChildren: children);

  static const String name = 'RestrictedRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i4.RestrictedPage();
    },
  );
}

/// generated route for
/// [_i5.SignInPage]
class SignInRoute extends _i8.PageRouteInfo<void> {
  const SignInRoute({List<_i8.PageRouteInfo>? children})
      : super(SignInRoute.name, initialChildren: children);

  static const String name = 'SignInRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i5.SignInPage();
    },
  );
}

/// generated route for
/// [_i6.SignoutPage]
class SignoutRoute extends _i8.PageRouteInfo<void> {
  const SignoutRoute({List<_i8.PageRouteInfo>? children})
      : super(SignoutRoute.name, initialChildren: children);

  static const String name = 'SignoutRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i6.SignoutPage();
    },
  );
}

/// generated route for
/// [_i7.TakePhotoPage]
class TakePhotoRoute extends _i8.PageRouteInfo<void> {
  const TakePhotoRoute({List<_i8.PageRouteInfo>? children})
      : super(TakePhotoRoute.name, initialChildren: children);

  static const String name = 'TakePhotoRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i7.TakePhotoPage();
    },
  );
}
