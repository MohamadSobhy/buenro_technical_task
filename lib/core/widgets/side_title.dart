import 'package:flutter/material.dart';

import '../../app_module.dart';
import '../theme/app_dimensions.dart';

class SideTitle extends StatelessWidget {
  final String title;
  final IconData? icon;

  const SideTitle({super.key, required this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.defaultSidePadding),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, color: AppModule.I.appColors.primaryColor),
            const SizedBox(width: AppDimensions.dimen_5),
          ],
          Text(
            title,
            style: AppModule.I.appStyles.text2(
              color: AppModule.I.appColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
