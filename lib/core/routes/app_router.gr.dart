// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:buenro_technical_task/core/routes/route_wrappers.dart' as _i2;
import 'package:buenro_technical_task/features/account/presentation/pages/account_page.dart'
    as _i1;
import 'package:buenro_technical_task/features/account/presentation/pages/settings_page.dart'
    as _i8;
import 'package:buenro_technical_task/features/favourites/presentation/pages/favourites_page.dart'
    as _i3;
import 'package:buenro_technical_task/features/home/presentation/pages/home_page.dart'
    as _i4;
import 'package:buenro_technical_task/features/hotels/presentation/pages/hotels_page.dart'
    as _i5;
import 'package:buenro_technical_task/features/hotels/presentation/pages/search_hotels_page.dart'
    as _i7;
import 'package:buenro_technical_task/features/overview/presentation/pages/overview_page.dart'
    as _i6;
import 'package:flutter/material.dart' as _i10;

/// generated route for
/// [_i1.AccountPage]
class AccountRoute extends _i9.PageRouteInfo<void> {
  const AccountRoute({List<_i9.PageRouteInfo>? children})
    : super(AccountRoute.name, initialChildren: children);

  static const String name = 'AccountRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i1.AccountPage();
    },
  );
}

/// generated route for
/// [_i2.AccountWrapperPage]
class AccountWrapperRoute extends _i9.PageRouteInfo<void> {
  const AccountWrapperRoute({List<_i9.PageRouteInfo>? children})
    : super(AccountWrapperRoute.name, initialChildren: children);

  static const String name = 'AccountWrapperRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i2.AccountWrapperPage();
    },
  );
}

/// generated route for
/// [_i3.FavouritesPage]
class FavouritesRoute extends _i9.PageRouteInfo<void> {
  const FavouritesRoute({List<_i9.PageRouteInfo>? children})
    : super(FavouritesRoute.name, initialChildren: children);

  static const String name = 'FavouritesRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i3.FavouritesPage();
    },
  );
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i4.HomePage();
    },
  );
}

/// generated route for
/// [_i5.HotelsPage]
class HotelsRoute extends _i9.PageRouteInfo<HotelsRouteArgs> {
  HotelsRoute({
    _i10.Key? key,
    required _i5.HotelsPageArgs? args,
    List<_i9.PageRouteInfo>? children,
  }) : super(
         HotelsRoute.name,
         args: HotelsRouteArgs(key: key, args: args),
         initialChildren: children,
       );

  static const String name = 'HotelsRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HotelsRouteArgs>();
      return _i5.HotelsPage(key: args.key, args: args.args);
    },
  );
}

class HotelsRouteArgs {
  const HotelsRouteArgs({this.key, required this.args});

  final _i10.Key? key;

  final _i5.HotelsPageArgs? args;

  @override
  String toString() {
    return 'HotelsRouteArgs{key: $key, args: $args}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! HotelsRouteArgs) return false;
    return key == other.key && args == other.args;
  }

  @override
  int get hashCode => key.hashCode ^ args.hashCode;
}

/// generated route for
/// [_i2.HotelsWrapperPage]
class HotelsWrapperRoute extends _i9.PageRouteInfo<void> {
  const HotelsWrapperRoute({List<_i9.PageRouteInfo>? children})
    : super(HotelsWrapperRoute.name, initialChildren: children);

  static const String name = 'HotelsWrapperRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return _i9.WrappedRoute(child: const _i2.HotelsWrapperPage());
    },
  );
}

/// generated route for
/// [_i6.OverviewPage]
class OverviewRoute extends _i9.PageRouteInfo<void> {
  const OverviewRoute({List<_i9.PageRouteInfo>? children})
    : super(OverviewRoute.name, initialChildren: children);

  static const String name = 'OverviewRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i6.OverviewPage();
    },
  );
}

/// generated route for
/// [_i7.SearchHotelsPage]
class SearchHotelsRoute extends _i9.PageRouteInfo<SearchHotelsRouteArgs> {
  SearchHotelsRoute({_i10.Key? key, List<_i9.PageRouteInfo>? children})
    : super(
        SearchHotelsRoute.name,
        args: SearchHotelsRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'SearchHotelsRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SearchHotelsRouteArgs>(
        orElse: () => const SearchHotelsRouteArgs(),
      );
      return _i7.SearchHotelsPage(key: args.key);
    },
  );
}

class SearchHotelsRouteArgs {
  const SearchHotelsRouteArgs({this.key});

  final _i10.Key? key;

  @override
  String toString() {
    return 'SearchHotelsRouteArgs{key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SearchHotelsRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [_i8.SettingsPage]
class SettingsRoute extends _i9.PageRouteInfo<void> {
  const SettingsRoute({List<_i9.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i8.SettingsPage();
    },
  );
}
