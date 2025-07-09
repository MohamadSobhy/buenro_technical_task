import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../app_module.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../../core/widgets/tap_effect.dart';
import '../../domain/entities/property.dart';
import 'property_favourite_button.dart';

class PropertyItemView extends StatelessWidget {
  const PropertyItemView({super.key, required this.property});

  final Property property;

  @override
  Widget build(BuildContext context) {
    return TapEffect(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: AppModule.I.appColors.darkCanvasColor,
          borderRadius: BorderRadius.circular(AppDimensions.dimen_10),
        ),
        margin: const EdgeInsets.only(bottom: AppDimensions.smallSidePadding),
        padding: const EdgeInsets.all(AppDimensions.mediumSidePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    AppDimensions.defaultRadius,
                  ),
                  child: CachedNetworkImage(
                    imageUrl: property.images.isNotEmpty
                        ? property.images.first.thumbnail
                        : '',
                    fit: BoxFit.cover,
                    width: double.maxFinite,
                  ),
                ),
                Positioned(
                  right: AppDimensions.defaultSidePadding,
                  bottom: AppDimensions.defaultSidePadding,
                  child: PropertyFavouriteButton(property: property),
                ),
              ],
            ),
            const SizedBox(height: AppDimensions.smallSidePadding),
            Text(
              property.name,
              style: AppModule.I.appStyles.text2(
                color: AppModule.I.appColors.primaryColor,
              ),
            ),
            if (property.description.trim().isNotEmpty) ...[
              const SizedBox(height: AppDimensions.dimen_5),
              Text(
                property.description,
                style: AppModule.I.appStyles.text3().copyWith(
                  fontWeight: AppFontWeights.regular,
                ),
              ),
            ],
            const SizedBox(height: AppDimensions.smallSidePadding),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber),
                const SizedBox(width: AppDimensions.dimen_5),
                Text(
                  property.overallRating.toString(),
                  style: AppModule.I.appStyles.text3(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
