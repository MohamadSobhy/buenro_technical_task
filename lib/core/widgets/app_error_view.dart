import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../app_module.dart';
import '../../generated/l10n.dart';
import '../theme/app_dimensions.dart';
import 'app_action_button.dart';

class AppErrorView extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;

  const AppErrorView({super.key, required this.message, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/images/img_error.svg',
            width: AppModule.I.screenWidth * 0.7,
          ),
          Text(message),
          const SizedBox(height: 16.0),
          AppActionButton.submit(
            onPressed: onRetry,
            text: S.current.retry,
            width: AppModule.I.screenWidth * 0.3,
            fitsFullWidth: false,
            borderRadius: BorderRadius.circular(AppDimensions.dimen_100),
          ),
        ],
      ),
    );
  }
}
