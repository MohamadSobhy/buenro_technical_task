import 'package:auto_route/auto_route.dart';
import 'package:buenro_technical_task/core/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../app_module.dart';
import '../../../../core/routes/app_router.gr.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../core/widgets/navigation_app_bar.dart';
import '../../../../generated/l10n.dart';

@RoutePage()
class AccountPage extends StatelessWidget {
  static const String routeName = '/account';

  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final translations = S.of(context);

    return AppScaffold(
      appBar: NavigationAppBar(title: translations.account),
      body: Padding(
        padding: const EdgeInsets.all(AppDimensions.defaultSidePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Icon(
                  Icons.account_circle_outlined,
                  size: 150,
                  color: AppModule.I.appColors.primaryColor,
                ),
                const SizedBox(height: AppDimensions.defaultSidePadding),
                Text(
                  'Mohammad Sobhy',
                  style: AppModule.I.appStyles.header5().copyWith(
                    fontWeight: AppFontWeights.bold,
                  ),
                ),
                const SizedBox(height: AppDimensions.dimen_5),
                Text('sobhymohamad623@gmail.com'),
              ],
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: Text(translations.change_language),
              subtitle: Text(
                Intl.message('en', name: AppModule.I.currentLangCode),
                style: AppModule.I.appStyles.text3(
                  color: AppModule.I.appColors.grey,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              tileColor: AppModule.I.appColors.darkCanvasColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDimensions.mediumRadius),
              ),
              onTap: () {
                final router = AutoRouter.of(context);
                router.push(SettingsRoute());
                // Navigate to profile page
              },
            ),
          ],
        ),
      ),
    );
  }
}
