import 'package:flutter/material.dart';

import '../../app_module.dart';
import '../theme/app_dimensions.dart';

class PaginationLoadingView extends StatelessWidget {
  final Color? baseColor;
  final Color? highlightColor;

  const PaginationLoadingView({super.key, this.baseColor, this.highlightColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.dimen_10,
        vertical: AppDimensions.dimen_5,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppDimensions.smallRadius),
        child: LinearProgressIndicator(
          backgroundColor: baseColor ?? AppModule.I.appColors.shimmerBaseColor,
          color: highlightColor ?? AppModule.I.appColors.shimmerHighlightColor,
          minHeight: AppDimensions.dimen_15,
        ),
      ),
    );
  }
}
