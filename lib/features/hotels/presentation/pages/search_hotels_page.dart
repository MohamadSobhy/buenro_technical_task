import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app_module.dart';
import '../../../../core/constants/constant_keys.dart';
import '../../../../core/enums/app_toast_mode.dart';
import '../../../../core/routes/app_router.gr.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/widgets/app_action_button.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../core/widgets/app_switch_tile.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/app_toast/app_toast.dart';
import '../../../../core/widgets/navigation_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../../domain/entities/search_data.dart';
import '../blocs/hotels_bloc/hotels_bloc.dart';
import '../blocs/latest_searches_bloc/latest_searches_bloc.dart';
import '../widgets/latest_search_item_view.dart';
import 'hotels_page.dart';

@RoutePage()
// ignore: must_be_immutable
class SearchHotelsPage extends StatelessWidget {
  static const String routeName = '/hotels';

  SearchHotelsPage({super.key});

  final _searchController = TextEditingController();
  final _checkInDateController = TextEditingController();
  final _checkOutDateController = TextEditingController();
  final _numberOfAdultsController = TextEditingController(text: '1');
  bool _showAds = true;

  @override
  Widget build(BuildContext context) {
    final translations = S.of(context);

    return AppScaffold(
      appBar: NavigationAppBar(title: translations.search_for_hotels),
      body: Padding(
        padding: const EdgeInsets.all(AppDimensions.defaultSidePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              margin: EdgeInsets.zero,
              color: AppModule.I.appColors.lightCanvasColor,
              child: Padding(
                padding: const EdgeInsets.all(AppDimensions.defaultSidePadding),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppTextField(
                      key: ConstantKeys.kQuerySearchFieldKey,
                      controller: _searchController,
                      hintText: translations.where,
                    ),
                    const SizedBox(height: AppDimensions.mediumSidePadding),
                    Row(
                      children: [
                        Expanded(
                          child: AppTextField.date(
                            key: ConstantKeys.kCheckInDateKey,
                            controller: _checkInDateController,
                            hintText: translations.check_in_date,
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(
                              const Duration(days: 365),
                            ),
                          ),
                        ),
                        const SizedBox(width: AppDimensions.mediumSidePadding),
                        Expanded(
                          child: AppTextField.date(
                            key: ConstantKeys.kCheckOutDateKey,
                            controller: _checkOutDateController,
                            hintText: translations.check_out_date,
                            firstDate:
                                DateTime.tryParse(
                                  _checkInDateController.text,
                                ) ??
                                DateTime.now().add(const Duration(days: 1)),
                            lastDate: DateTime.now().add(
                              const Duration(days: 365),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppDimensions.largeSidePadding),
                    AppTextField(
                      key: ConstantKeys.kNumberOfAdultsFieldKey,
                      controller: _numberOfAdultsController,
                      hintText: translations.number_of_adults,
                      textInputType: TextInputType.numberWithOptions(),
                    ),
                    const SizedBox(height: AppDimensions.largeSidePadding),
                    AppSwitchTile(
                      key: ConstantKeys.kShowAdsSwitchKey,
                      title: Text(
                        translations.show_ads,
                        style: AppModule.I.appStyles.text3(),
                      ),
                      onChanged: (isChecked) => _showAds = isChecked,
                    ),
                    const SizedBox(height: AppDimensions.largeSidePadding),
                    AppActionButton.submit(
                      key: ConstantKeys.kSearchBtnKey,
                      onPressed: () => _searchForHotelsCallback(context),
                      text: translations.search_for_hotels,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: AppDimensions.defaultSidePadding,
                ),
                child: BlocBuilder<LatestSearchesBloc, LatestSearchesState>(
                  builder: (ctx, state) {
                    if (state is LatestSearchesFetchedState) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(translations.latest_searches),
                          const SizedBox(
                            height: AppDimensions.mediumSidePadding,
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              padding: EdgeInsets.zero,
                              child: Wrap(
                                runAlignment: WrapAlignment.start,
                                spacing: AppDimensions.mediumSidePadding,
                                runSpacing: AppDimensions.mediumSidePadding,
                                children: state.searches
                                    .map(
                                      (searchInfo) => LatestSearchItemView(
                                        searchData: searchInfo,
                                        onSelect: _onLatestSearchSelected,
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ),
                        ],
                      );
                    }

                    return SizedBox();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onLatestSearchSelected(SearchData searchData) {
    _searchController.text = searchData.query;
    _checkInDateController.text = searchData.checkInDate;
    _checkOutDateController.text = searchData.checkOutDate;
    _numberOfAdultsController.text = searchData.numberOfAdults.toString();
  }

  void _searchForHotelsCallback(BuildContext context) {
    if (_searchController.text.trim().isEmpty ||
        _checkInDateController.text.trim().isEmpty ||
        _checkOutDateController.text.trim().isEmpty) {
      AppToast.I.showToast(
        S.current.fill_missing_fields,
        mode: AppToastMode.error,
      );
      return;
    }

    final bloc = context.read<HotelsBloc>();
    bloc.add(
      SearchForHotelsEvent(
        query: _searchController.text.trim(),
        checkInDate: _checkInDateController.text,
        checkOutDate: _checkOutDateController.text,
        numberOfAdults: int.tryParse(_numberOfAdultsController.text) ?? 1,
      ),
    );

    final router = AutoRouter.of(context);
    router
        .push(
          HotelsRoute(
            args: HotelsPageArgs(
              query: _searchController.text.trim(),
              checkInDate: _checkInDateController.text,
              checkOutDate: _checkOutDateController.text,
              numberOfAdults: int.tryParse(_numberOfAdultsController.text) ?? 1,
              showAds: _showAds,
            ),
          ),
        )
        .then((_) {
          final bloc = context.read<LatestSearchesBloc>();
          bloc.add(FetchedLatestSearchesEvent());
        });
  }
}
