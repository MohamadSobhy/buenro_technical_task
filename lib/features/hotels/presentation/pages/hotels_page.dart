import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:buenro_technical_task/core/enums/app_toast_mode.dart';
import 'package:buenro_technical_task/core/widgets/app_toast/app_toast.dart';
import 'package:buenro_technical_task/core/widgets/pagination_loading_view.dart';
import 'package:columnbuilder/columnbuilder.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app_module.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/widgets/app_error_view.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../core/widgets/navigation_app_bar.dart';
import '../../../../core/widgets/scroll_notification_handler.dart';
import '../../../../core/widgets/side_title.dart';
import '../../../../generated/l10n.dart';
import '../blocs/hotels_bloc/hotels_bloc.dart';
import '../widgets/property_ad_view.dart';
import '../widgets/property_item_view.dart';

class HotelsPageArgs extends Equatable {
  final String query;
  final String checkInDate;
  final String checkOutDate;
  final int numberOfAdults;
  final bool showAds;

  const HotelsPageArgs({
    required this.query,
    required this.checkInDate,
    required this.checkOutDate,
    required this.numberOfAdults,
    required this.showAds,
  });

  @override
  List<Object?> get props => [
    query,
    checkInDate,
    checkOutDate,
    numberOfAdults,
    showAds,
  ];
}

@RoutePage()
class HotelsPage extends StatelessWidget {
  final HotelsPageArgs? args;

  const HotelsPage({super.key, required this.args});

  static bool _canPaginate = true;

  @override
  Widget build(BuildContext context) {
    final translations = S.of(context);

    return AppScaffold(
      appBar: NavigationAppBar(title: args?.query ?? translations.hotels),
      body: BlocConsumer<HotelsBloc, HotelsState>(
        buildWhen: (_, state) =>
            state is HotelsLoadingState ||
            state is HotelsErrorState ||
            state is HotelsFetchedState,
        listener: _onListeningToHotelsBlocStates,
        builder: (context, state) {
          if (state is HotelsLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HotelsErrorState) {
            return AppErrorView(
              message: state.message,
              onRetry: () => _searchHotelsCallback(context),
            );
          } else if (state is HotelsFetchedState) {
            return ScrollNotificationHandler(
              canLoadMore: state.response.nextPageToken != null,
              onLoadMore: () => _searchHotelsCallback(
                context,
                nextPageToken: state.response.nextPageToken,
              ),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (args?.showAds == true) ...[
                          SideTitle(title: translations.ads, icon: Icons.adobe),
                          SizedBox(
                            height: AppModule.I.screenWidth * 0.25,
                            child: ListView.builder(
                              itemCount: state.response.ads.length,
                              scrollDirection: Axis.horizontal,
                              itemExtent: AppModule.I.screenWidth * 0.45,
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppDimensions.mediumSidePadding,
                              ),
                              itemBuilder: (ctx, index) {
                                final adData = state.response.ads[index];

                                return PropertyAdView(adData: adData);
                              },
                            ),
                          ),
                          SideTitle(
                            title: translations.hotels,
                            icon: Icons.hotel,
                          ),
                        ],
                        Padding(
                          padding: const EdgeInsets.only(
                            left: AppDimensions.mediumSidePadding,
                            right: AppDimensions.mediumSidePadding,
                            bottom: AppDimensions.extraLargeSidePadding,
                          ),
                          child: ColumnBuilder(
                            itemCount: state.response.properties.length,
                            itemBuilder: (context, index) {
                              final hotel = state.response.properties[index];
                              return Column(
                                children: [
                                  PropertyItemView(property: hotel),
                                  BlocBuilder<HotelsBloc, HotelsState>(
                                    builder: (context, pageState) {
                                      return Visibility(
                                        visible:
                                            index ==
                                                state
                                                        .response
                                                        .properties
                                                        .length -
                                                    1 &&
                                            pageState
                                                is HotelsNextPageLoadingState,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            bottom:
                                                AppDimensions.mediumSidePadding,
                                          ),
                                          child: PaginationLoadingView(),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }

          return SizedBox();
        },
      ),
    );
  }

  void _onListeningToHotelsBlocStates(ctx, state) {
    if (state is HotelsNextPageLoadingState) {
      _canPaginate = false;
    } else if (state is HotelsNextPageErrorState) {
      AppToast.I.showToast(state.message, mode: AppToastMode.error);
      _canPaginate = true;
    } else {
      _canPaginate = true;
    }

    log(state.runtimeType.toString());
    log(_canPaginate.toString());
  }

  void _searchHotelsCallback(BuildContext context, {String? nextPageToken}) {
    final bloc = context.read<HotelsBloc>();

    if (nextPageToken != null && !_canPaginate) {
      return;
    }

    log('Loading hotels...');

    bloc.add(
      SearchForHotelsEvent(
        query: args?.query ?? '',
        checkInDate: args?.checkInDate ?? '',
        checkOutDate: args?.checkOutDate ?? '',
        numberOfAdults: args?.numberOfAdults ?? 1,
        nextPageToken: nextPageToken,
      ),
    );
  }
}
