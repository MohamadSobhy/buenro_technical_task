import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../app_module.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/widgets/app_error_view.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../core/widgets/navigation_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../../../hotels/presentation/widgets/property_item_view.dart';
import '../favourites_bloc/favourites_bloc.dart';

@RoutePage()
class FavouritesPage extends StatelessWidget {
  static const String routeName = '/favourites';

  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final translations = S.of(context);

    return AppScaffold(
      appBar: NavigationAppBar(title: translations.favorites),
      body: BlocBuilder<FavouritesBloc, FavouritesState>(
        buildWhen: (_, state) =>
            state is FavouritesLoadingState ||
            state is FavouritesErrorState ||
            state is FavouritePropertiesFetchedState,
        builder: (context, state) {
          if (state is FavouritesLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is FavouritesErrorState) {
            return AppErrorView(message: state.message);
          } else if (state is FavouritePropertiesFetchedState) {
            if (state.properties.isEmpty) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.extraLargeSidePadding,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/no_favourites.svg',
                      height: AppModule.I.screenHeight * 0.35,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: Text(
                        translations.no_favourites_msg,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              );
            }

            return ListView.builder(
              itemCount: state.properties.length,
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.mediumSidePadding,
              ),
              itemBuilder: (ctx, index) {
                final property = state.properties[index];
                return PropertyItemView(property: property);
              },
            );
          }

          return SizedBox();
        },
      ),
    );
  }
}
