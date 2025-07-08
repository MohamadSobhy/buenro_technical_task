import 'package:buenro_technical_task/core/routes/app_router.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'app_module.dart';
import 'core/localization/localization_controller.dart';
import 'core/widgets/app_toast/app_toast.dart';
import 'core/widgets/app_toast/app_toast_view.dart';
import 'generated/l10n.dart';

class PlatformApp extends StatelessWidget {
  const PlatformApp({super.key});

  static final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return Consumer<LocalizationController>(
      builder: (ctx, provider, _) {
        return Directionality(
          textDirection: TextDirection.ltr,
          child: Stack(
            children: [
              MaterialApp.router(
                routerConfig: _appRouter.config(),
                title: 'Buenro Technical Task',
                debugShowCheckedModeBanner: false,
                theme: AppModule.I.defaultTheme,
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                locale: Locale(provider.currentLocale),
                scaffoldMessengerKey: AppModule.I.scaffoldMessengerKey,
                localeResolutionCallback: (deviceLocale, supportedLocales) {
                  debugPrint('Device locale: ${deviceLocale!.languageCode}');

                  final supportedLanguages = supportedLocales
                      .map((e) => e.languageCode)
                      .toList();

                  if (supportedLanguages.contains(deviceLocale.languageCode)) {
                    return Locale(deviceLocale.languageCode, '');
                  }

                  return supportedLocales.first;
                },
              ),
              StreamBuilder<AppToastData>(
                stream: AppModule.I.toastController.stream,
                builder: (context, snapshot) {
                  return snapshot.data?.message != null &&
                          snapshot.data!.message.trim().isNotEmpty
                      ? Positioned(
                          key: UniqueKey(),
                          bottom: defaultTargetPlatform == TargetPlatform.iOS
                              ? 40
                              : 20,
                          left: 0,
                          right: 0,
                          child: SafeArea(
                            child: AppToastView(toast: snapshot.data!),
                          ),
                        )
                      : const SizedBox();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
