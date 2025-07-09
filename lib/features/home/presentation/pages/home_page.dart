import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../../../app_module.dart';
import '../../../../core/routes/app_router.gr.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../generated/l10n.dart';
import '../../../../injection_container.dart';
import '../../../favourites/presentation/favourites_bloc/favourites_bloc.dart';

@RoutePage()
class HomePage extends StatelessWidget implements AutoRouteWrapper {
  static const String routeName = '/home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final translations = S.of(context);

    return AutoTabsRouter(
      routes: const [
        OverviewRoute(),
        HotelsWrapperRoute(),
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
              if (index == 1 || index == 2) {
                final bloc = servLocator<FavouritesBloc>();
                bloc.add(FetchFavouritePropertiesEvent());
              }

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

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: servLocator<FavouritesBloc>(),
      child: this,
    );
  }
}
