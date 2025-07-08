import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_module.dart';
import 'core/localization/localization_controller.dart';
import 'core/theme/app_dimensions.dart';
import 'core/theme/providers/app_themes_provider.dart';
import 'core/theme/themes.dart';
import 'injection_container.dart';
import 'platform_app.dart';

class BuenroTechnicalTaskApp extends StatelessWidget {
  const BuenroTechnicalTaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: servLocator<LocalizationController>(),
      child: AppThemesProvider(
        scaffoldTheme: AppScaffoldTheme(
          backgroundGradientOpacity: 1,
          backgroundColor: AppModule.I.appColors.canvasColor,
        ),
        actionButtonTheme: AppModule.I.appStyles.defaultActionButtonTheme
            .copyWith(
              enableGradient: true,
              textStyle: AppModule.I.appStyles.text3(),
              borderRadius: BorderRadius.circular(AppDimensions.defaultRadius),
              borderColor: AppModule.I.appColors.primaryColor,
              disabledColor: AppModule.I.appColors.primaryColor.withOpacity(
                0.3,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: kIsWeb
                    ? AppDimensions.dimen_22
                    : AppDimensions.dimen_16,
              ),
            ),
        child: const PlatformApp(),
      ),
    );
  }
}
