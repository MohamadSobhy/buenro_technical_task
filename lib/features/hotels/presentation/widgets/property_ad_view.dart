import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../app_module.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../domain/entities/property.dart';

class PropertyAdView extends StatelessWidget {
  const PropertyAdView({super.key, required this.adData});

  final Property adData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.dimen_5),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppDimensions.defaultRadius),
              child: CachedNetworkImage(
                imageUrl: adData.thumbnail,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppDimensions.smallSidePadding),
            child: Text(
              adData.name,
              maxLines: 2,
              style: AppModule.I.appStyles
                  .text3(color: AppModule.I.appColors.white)
                  .copyWith(
                    shadows: [
                      Shadow(
                        color: AppModule.I.appColors.black.withValues(
                          alpha: 0.5,
                        ),
                        offset: const Offset(0, 1),
                        blurRadius: 2,
                      ),
                    ],
                  ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: AppDimensions.dimen_5,
            child: Chip(
              label: Text(adData.price),
              padding: EdgeInsets.zero,
              backgroundColor: AppModule.I.appColors.primaryColor.withValues(
                alpha: 0.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
