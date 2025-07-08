// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:buenro_technical_task/core/routes/route_wrappers.dart' as _i2;
import 'package:buenro_technical_task/features/account/presentation/pages/account_page.dart'
    as _i1;
import 'package:buenro_technical_task/features/account/presentation/pages/settings_page.dart'
    as _i7;
import 'package:buenro_technical_task/features/favourites/presentation/pages/favourites_page.dart'
    as _i3;
import 'package:buenro_technical_task/features/home/presentation/pages/home_page.dart'
    as _i4;
import 'package:buenro_technical_task/features/hotels/presentation/pages/hotels_page.dart'
    as _i5;
import 'package:buenro_technical_task/features/overview/presentation/pages/overview_page.dart'
    as _i6;

/// generated route for
/// [_i1.AccountPage]
class AccountRoute extends _i8.PageRouteInfo<void> {
  const AccountRoute({List<_i8.PageRouteInfo>? children})
    : super(AccountRoute.name, initialChildren: children);

  static const String name = 'AccountRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i1.AccountPage();
    },
  );
}

/// generated route for
/// [_i2.AccountWrapperPage]
class AccountWrapperRoute extends _i8.PageRouteInfo<void> {
  const AccountWrapperRoute({List<_i8.PageRouteInfo>? children})
    : super(AccountWrapperRoute.name, initialChildren: children);

  static const String name = 'AccountWrapperRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i2.AccountWrapperPage();
    },
  );
}

/// generated route for
/// [_i3.FavouritesPage]
class FavouritesRoute extends _i8.PageRouteInfo<void> {
  const FavouritesRoute({List<_i8.PageRouteInfo>? children})
    : super(FavouritesRoute.name, initialChildren: children);

  static const String name = 'FavouritesRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i3.FavouritesPage();
    },
  );
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i4.HomePage();
    },
  );
}

/// generated route for
/// [_i5.HotelsPage]
class HotelsRoute extends _i8.PageRouteInfo<void> {
  const HotelsRoute({List<_i8.PageRouteInfo>? children})
    : super(HotelsRoute.name, initialChildren: children);

  static const String name = 'HotelsRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i5.HotelsPage();
    },
  );
}

/// generated route for
/// [_i6.OverviewPage]
class OverviewRoute extends _i8.PageRouteInfo<void> {
  const OverviewRoute({List<_i8.PageRouteInfo>? children})
    : super(OverviewRoute.name, initialChildren: children);

  static const String name = 'OverviewRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i6.OverviewPage();
    },
  );
}

/// generated route for
/// [_i7.SettingsPage]
class SettingsRoute extends _i8.PageRouteInfo<void> {
  const SettingsRoute({List<_i8.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i7.SettingsPage();
    },
  );
}
