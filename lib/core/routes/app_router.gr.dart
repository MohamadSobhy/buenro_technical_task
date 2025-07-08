// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:buenro_technical_task/features/account/presentation/pages/account_page.dart'
    as _i1;
import 'package:buenro_technical_task/features/favourites/presentation/pages/favourites_page.dart'
    as _i2;
import 'package:buenro_technical_task/features/home/presentation/pages/home_page.dart'
    as _i3;
import 'package:buenro_technical_task/features/hotels/presentation/pages/hotels_page.dart'
    as _i4;
import 'package:buenro_technical_task/features/overview/presentation/pages/overview_page.dart'
    as _i5;

/// generated route for
/// [_i1.AccountPage]
class AccountRoute extends _i6.PageRouteInfo<void> {
  const AccountRoute({List<_i6.PageRouteInfo>? children})
    : super(AccountRoute.name, initialChildren: children);

  static const String name = 'AccountRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i1.AccountPage();
    },
  );
}

/// generated route for
/// [_i2.FavouritesPage]
class FavouritesRoute extends _i6.PageRouteInfo<void> {
  const FavouritesRoute({List<_i6.PageRouteInfo>? children})
    : super(FavouritesRoute.name, initialChildren: children);

  static const String name = 'FavouritesRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i2.FavouritesPage();
    },
  );
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomePage();
    },
  );
}

/// generated route for
/// [_i4.HotelsPage]
class HotelsRoute extends _i6.PageRouteInfo<void> {
  const HotelsRoute({List<_i6.PageRouteInfo>? children})
    : super(HotelsRoute.name, initialChildren: children);

  static const String name = 'HotelsRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.HotelsPage();
    },
  );
}

/// generated route for
/// [_i5.OverviewPage]
class OverviewRoute extends _i6.PageRouteInfo<void> {
  const OverviewRoute({List<_i6.PageRouteInfo>? children})
    : super(OverviewRoute.name, initialChildren: children);

  static const String name = 'OverviewRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i5.OverviewPage();
    },
  );
}
