import 'package:flutter/material.dart';

import '../../../../app_module.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/widgets/tap_effect.dart';
import '../../domain/entities/search_data.dart';

class LatestSearchItemView extends StatelessWidget {
  final SearchData searchData;
  final Function(SearchData)? onSelect;

  const LatestSearchItemView({
    super.key,
    required this.searchData,
    this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return TapEffect(
      onTap: () => onSelect?.call(searchData),
      child: Container(
        padding: const EdgeInsets.all(AppDimensions.defaultSidePadding),
        decoration: BoxDecoration(
          color: AppModule.I.appColors.lightCanvasColor,
          border: Border.all(color: AppModule.I.appColors.darkCanvasColor),
          borderRadius: BorderRadius.circular(AppDimensions.defaultRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(searchData.query),
            Text(searchData.checkInDate),
            Text(searchData.checkOutDate),
            Text(searchData.numberOfAdults.toString()),
          ],
        ),
      ),
    );
  }
}
