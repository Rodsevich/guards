// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:minimal/pages/geolocation_permission_guard_page.dart' as _i1;
import 'package:minimal/pages/home_page.dart' as _i3;
import 'package:minimal/pages/no_gps_guard_page.dart' as _i2;

/// generated route for
/// [_i1.PageGeolocationPermissionGuard]
class RouteGeolocationPermissionGuard extends _i4.PageRouteInfo<void> {
  const RouteGeolocationPermissionGuard({List<_i4.PageRouteInfo>? children})
    : super(RouteGeolocationPermissionGuard.name, initialChildren: children);

  static const String name = 'RouteGeolocationPermissionGuard';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.PageGeolocationPermissionGuard();
    },
  );
}

/// generated route for
/// [_i2.PageGpsNotActiveGuard]
class RouteGpsNotActiveGuard extends _i4.PageRouteInfo<void> {
  const RouteGpsNotActiveGuard({List<_i4.PageRouteInfo>? children})
    : super(RouteGpsNotActiveGuard.name, initialChildren: children);

  static const String name = 'RouteGpsNotActiveGuard';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.PageGpsNotActiveGuard();
    },
  );
}

/// generated route for
/// [_i3.PageHome]
class RouteHome extends _i4.PageRouteInfo<void> {
  const RouteHome({List<_i4.PageRouteInfo>? children})
    : super(RouteHome.name, initialChildren: children);

  static const String name = 'RouteHome';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.PageHome();
    },
  );
}
