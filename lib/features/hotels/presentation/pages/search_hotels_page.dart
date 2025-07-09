import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app_module.dart';
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
import '../hotels_bloc/hotels_bloc.dart';
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
        child: Card(
          margin: EdgeInsets.zero,
          color: AppModule.I.appColors.lightCanvasColor,
          child: Padding(
            padding: const EdgeInsets.all(AppDimensions.defaultSidePadding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppTextField(
                  controller: _searchController,
                  hintText: translations.where,
                ),
                const SizedBox(height: AppDimensions.mediumSidePadding),
                Row(
                  children: [
                    Expanded(
                      child: AppTextField.date(
                        controller: _checkInDateController,
                        hintText: translations.check_in_date,
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 365)),
                      ),
                    ),
                    const SizedBox(width: AppDimensions.mediumSidePadding),
                    Expanded(
                      child: AppTextField.date(
                        controller: _checkOutDateController,
                        hintText: translations.check_out_date,
                        firstDate:
                            DateTime.tryParse(_checkInDateController.text) ??
                            DateTime.now().add(const Duration(days: 1)),
                        lastDate: DateTime.now().add(const Duration(days: 365)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppDimensions.largeSidePadding),
                AppTextField(
                  controller: _numberOfAdultsController,
                  hintText: translations.number_of_adults,
                  textInputType: TextInputType.numberWithOptions(),
                ),
                const SizedBox(height: AppDimensions.largeSidePadding),
                AppSwitchTile(
                  title: Text(
                    translations.show_ads,
                    style: AppModule.I.appStyles.text3(),
                  ),
                  onChanged: (isChecked) => _showAds = isChecked,
                ),
                const SizedBox(height: AppDimensions.largeSidePadding),
                AppActionButton.submit(
                  onPressed: () => _searchForHotelsCallback(context),
                  text: translations.search_for_hotels,
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
      ),
    );

    final router = AutoRouter.of(context);
    router.push(
      HotelsRoute(
        args: HotelsPageArgs(
          query: _searchController.text.trim(),
          checkInDate: _checkInDateController.text,
          checkOutDate: _checkOutDateController.text,
          numberOfAdults: int.tryParse(_numberOfAdultsController.text) ?? 1,
          showAds: _showAds,
        ),
      ),
    );
  }
}
