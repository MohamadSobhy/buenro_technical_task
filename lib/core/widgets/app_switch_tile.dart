import 'package:flutter/material.dart';

import '../../app_module.dart';
import '../theme/app_dimensions.dart';

class AppSwitchTile extends StatefulWidget {
  final Widget? title;
  final Function(bool)? onChanged;

  const AppSwitchTile({super.key, this.title, this.onChanged});

  @override
  State<AppSwitchTile> createState() => _AppSwitchTileState();
}

class _AppSwitchTileState extends State<AppSwitchTile> {
  bool _isChecked = true;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: _isChecked,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: AppModule.I.appColors.primaryColor,
          width: AppDimensions.dimen_1,
        ),
        borderRadius: BorderRadius.circular(AppDimensions.defaultRadius),
      ),
      dense: true,
      title: widget.title,
      onChanged: (isChecked) {
        setState(() {
          _isChecked = isChecked;
        });

        widget.onChanged?.call(isChecked);
      },
    );
  }
}
