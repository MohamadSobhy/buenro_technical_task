import 'package:auto_route/auto_route.dart';
import 'package:buenro_technical_task/app_module.dart';
import 'package:buenro_technical_task/core/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../../../core/routes/app_router.gr.dart';
import '../../../../generated/l10n.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  static const String routeName = '/home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final translations = S.of(context);

    return AutoTabsRouter(
      routes: const [
        OverviewRoute(),
        HotelsRoute(),
        FavouritesRoute(),
        AccountWrapperRoute(),
      ],
      builder: (context, child) {
        final router = AutoTabsRouter.of(context);

        return AppScaffold(
          body: child,
          bottomNavigationBar: SalomonBottomBar(
            backgroundColor: AppModule.I.appColors.darkCanvasColor,
            margin: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 10.0,
            ),
            currentIndex: router.activeIndex,
            onTap: (index) {
              router.setActiveIndex(index);
            },
            items: [
              SalomonBottomBarItem(
                icon: Icon(Icons.view_agenda_outlined),
                title: Text(translations.overview),
                activeIcon: Icon(Icons.view_agenda_rounded),
              ),
              SalomonBottomBarItem(
                icon: Icon(Icons.hotel_outlined),
                title: Text(translations.hotels),
                activeIcon: Icon(Icons.hotel_rounded),
              ),
              SalomonBottomBarItem(
                icon: Icon(Icons.favorite_outline),
                title: Text(translations.favorites),
                activeIcon: Icon(Icons.favorite_rounded),
              ),
              SalomonBottomBarItem(
                icon: Icon(Icons.account_circle_outlined),
                title: Text(translations.account),
                activeIcon: Icon(Icons.account_circle_rounded),
              ),
            ],
          ),
        );
      },
    );
  }
}
