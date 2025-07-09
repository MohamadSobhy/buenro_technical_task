import 'package:auto_route/auto_route.dart';
import 'package:buenro_technical_task/core/routes/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  AppRouter._();

  static final AppRouter _instance = AppRouter._();
  factory AppRouter() => _instance;

  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: HomeRoute.page,
      initial: true,
      children: [
        AutoRoute(page: OverviewRoute.page, path: 'overview'),
        AutoRoute(
          page: HotelsWrapperRoute.page,
          path: 'hotels',
          children: [
            AutoRoute(page: SearchHotelsRoute.page, initial: true),
            AutoRoute(page: HotelsRoute.page),
          ],
        ),
        AutoRoute(page: FavouritesRoute.page, path: 'favourites'),
        AutoRoute(
          page: AccountWrapperRoute.page,
          path: 'account',
          children: [
            CustomRoute(
              page: AccountRoute.page,
              path: '',
              initial: true,
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
            CustomRoute(
              page: SettingsRoute.page,
              path: 'settings',
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
          ],
        ),
      ],
    ),
  ];
}
