import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../app_module.dart';
import '../../../../core/localization/localization_controller.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../core/widgets/navigation_app_bar.dart';
import '../../../../generated/l10n.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final translations = S.of(context);

    return AppScaffold(
      appBar: NavigationAppBar(title: translations.settings),
      body: Padding(
        padding: const EdgeInsets.all(AppDimensions.defaultSidePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: AppDimensions.largeSidePadding),
            Text(translations.select_language),
            const SizedBox(height: AppDimensions.largeSidePadding),
            Expanded(
              child: ListView.separated(
                itemCount: S.delegate.supportedLocales.length,
                separatorBuilder: (_, __) =>
                    const SizedBox(height: AppDimensions.mediumSidePadding),
                itemBuilder: (context, index) {
                  final locale = S.delegate.supportedLocales[index];

                  return ListTile(
                    title: Text(Intl.message('', name: locale.languageCode)),
                    tileColor: AppModule.I.appColors.darkCanvasColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        AppDimensions.mediumRadius,
                      ),
                    ),
                    onTap: () {
                      final controller = context.read<LocalizationController>();
                      controller.changeAppLanguage(locale.languageCode);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
