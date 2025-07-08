import 'package:flutter/material.dart';

import '../../app_module.dart';
import '../theme/app_styles.dart';

class NavigationAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<Widget>? actions;

  const NavigationAppBar({
    super.key,
    required this.title,
    this.actions,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: AppModule.I.appStyles.header4().copyWith(
          fontWeight: AppFontWeights.bold,
        ),
      ),
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
