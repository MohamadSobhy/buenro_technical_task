import 'package:auto_route/auto_route.dart';
import 'package:buenro_technical_task/app_module.dart';
import 'package:buenro_technical_task/core/theme/app_dimensions.dart';
import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';

@RoutePage()
class OverviewPage extends StatelessWidget {
  static const String routeName = '/overview';

  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final translations = S.of(context);

    return Container(
      color: Color.fromRGBO(234, 219, 184, 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset('assets/images/overview_bg.jpg', fit: BoxFit.fill),
          Padding(
            padding: const EdgeInsets.all(AppDimensions.defaultSidePadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  translations.overview,
                  style: AppModule.I.appStyles.header3(),
                ),
                Text(translations.book_hotels_now),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
