import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../app_module.dart';
import '../theme/app_dimensions.dart';
import '../theme/providers/app_themes_provider.dart';
import '../theme/themes.dart';

enum AppTextFieldType { generic, email, password, date }

class AppTextField extends StatefulWidget {
  final AppTextFieldType textFieldType;
  final bool allowCleanButton;
  final String initialValue;
  final String? labelText;
  final TextCapitalization textCapitalization;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final bool obscureText;
  final bool autoCorrect;
  final bool enableSuggestions;
  final bool isPassword;
  final bool readOnly;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Widget? prefix;
  final Widget? suffix;
  final String? Function(String?)? validator;
  final bool Function(String?)? onSuccess;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final void Function()? onTap;
  final Color? fillColor;
  final Color? labelColor;
  final int? maxLines;
  final bool alignLabelWithHint;
  final Color? textColor;
  final String? hintText;
  final Color? hintColor;
  final int? maxLength;

  final String prefixText;
  final TextStyle? prefixTextStyle;
  final Function(int, String, String?)? onMentionAdded;
  final Function(int)? onMentionRemoved;
  final List<TextInputFormatter> inputFormatters;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? disabledBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final bool showSuffix;
  final bool showPrefix;
  final String obscuringCharacter;
  final int? minLines;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final DateTime? initialDate;
  final TimeOfDay? initialTime;
  final Function(String)? onFieldSubmitted;
  final Function()? onEditingComplete;
  final bool? enabled;
  final ThemeData? androidTheme;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final TextStyle? errorStyle;
  final BorderRadius? borderRadius;
  final Widget Function(bool, {VoidCallback? onClean})? cleanIconBuilder;
  final Widget Function(bool)? obsecureVisibilityToggleBuilder;
  final Color? errorFillColor;
  final double? errorHeight;
  final double? height;
  final Color? suffixIconColor;

  AppTextField({
    super.key,
    this.allowCleanButton = false,
    this.textFieldType = AppTextFieldType.generic,
    this.controller,
    this.initialValue = '',
    this.labelText,
    Color? labelColor,
    this.textCapitalization = TextCapitalization.sentences,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.obscureText = false,
    this.autoCorrect = true,
    this.enableSuggestions = true,
    this.prefix,
    this.suffix,
    this.focusNode,
    this.isPassword = false,
    this.readOnly = false,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.onTap,
    this.fillColor,
    this.maxLines = 1,
    this.alignLabelWithHint = false,
    this.textColor,
    this.style,
    this.hintText,
    this.hintColor,
    this.maxLength,

    this.prefixText = "",
    this.prefixTextStyle,
    this.onMentionAdded,
    this.onMentionRemoved,
    this.inputFormatters = const [],
    this.border,
    this.disabledBorder,
    this.enabledBorder,
    this.focusedBorder,
    this.focusedErrorBorder,
    this.errorBorder,
    this.showSuffix = true,
    this.showPrefix = true,
    this.obscuringCharacter = '•',
    this.minLines,
    this.firstDate,
    this.lastDate,
    this.initialDate,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.enabled,
    this.contentPadding,
    this.hintStyle,
    this.errorStyle,
    this.onSuccess,
    this.cleanIconBuilder,
    this.borderRadius = const BorderRadius.all(Radius.circular(15)),
    this.obsecureVisibilityToggleBuilder,
    this.errorFillColor,
    this.errorHeight,
    this.height,
    this.suffixIconColor,
  }) : labelColor = labelColor ?? AppModule.I.appColors.darkTextColor,
       initialTime = null,
       androidTheme = null;

  const AppTextField.email({
    super.key,
    this.allowCleanButton = false,
    this.textFieldType = AppTextFieldType.email,
    this.controller,
    this.initialValue = '',
    this.labelText,
    this.textInputAction = TextInputAction.next,
    this.obscureText = false,
    this.enableSuggestions = true,
    this.readOnly = false,
    this.prefix,
    this.suffix,
    this.focusNode,
    this.isPassword = false,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.onTap,
    this.fillColor,
    this.maxLines = 1,
    this.alignLabelWithHint = false,
    this.textColor,
    this.style,
    this.hintText,
    this.hintColor,
    this.maxLength,

    this.onMentionAdded,
    this.onMentionRemoved,
    this.inputFormatters = const [],
    this.border,
    this.enabledBorder,
    this.disabledBorder,
    this.focusedBorder,
    this.focusedErrorBorder,
    this.errorBorder,
    this.showSuffix = true,
    this.showPrefix = true,
    this.obscuringCharacter = '•',
    this.minLines,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.enabled,
    this.contentPadding,
    this.hintStyle,
    this.errorStyle,
    this.onSuccess,
    this.borderRadius = const BorderRadius.all(Radius.circular(15)),
    this.labelColor,
    this.cleanIconBuilder,
    this.obsecureVisibilityToggleBuilder,
    this.errorFillColor,
    this.errorHeight,
    this.height,
    this.suffixIconColor,
  }) : autoCorrect = false,

       textCapitalization = TextCapitalization.none,
       textInputType = TextInputType.emailAddress,
       prefixText = "",
       prefixTextStyle = null,
       firstDate = null,
       lastDate = null,
       initialDate = null,
       initialTime = null,
       androidTheme = null;

  const AppTextField.password({
    super.key,
    this.allowCleanButton = false,
    this.textFieldType = AppTextFieldType.password,
    this.controller,
    this.initialValue = '',
    this.labelText,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.prefix,
    this.suffix,
    this.focusNode,
    this.isPassword = true,
    this.readOnly = false,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.onTap,
    this.fillColor,
    this.alignLabelWithHint = false,
    this.textColor,
    this.style,
    this.hintText,
    this.hintColor,
    this.maxLength,

    this.onMentionAdded,
    this.onMentionRemoved,
    this.inputFormatters = const [],
    this.border,
    this.enabledBorder,
    this.disabledBorder,
    this.focusedBorder,
    this.focusedErrorBorder,
    this.errorBorder,
    this.showSuffix = true,
    this.showPrefix = true,
    this.obscuringCharacter = '•',
    this.minLines,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.enabled,
    this.contentPadding,
    this.hintStyle,
    this.errorStyle,
    this.onSuccess,
    this.borderRadius = const BorderRadius.all(Radius.circular(15)),
    this.labelColor,
    this.cleanIconBuilder,
    this.obsecureVisibilityToggleBuilder,
    this.errorFillColor,
    this.errorHeight,
    this.height,
    this.suffixIconColor,
  }) : obscureText = true,
       maxLines = 1,
       autoCorrect = false,
       enableSuggestions = false,

       textCapitalization = TextCapitalization.none,
       prefixText = "",
       prefixTextStyle = null,
       firstDate = null,
       lastDate = null,
       initialDate = null,
       initialTime = null,
       androidTheme = null;

  const AppTextField.date({
    super.key,
    this.allowCleanButton = false,
    this.textFieldType = AppTextFieldType.date,
    this.controller,
    this.initialValue = '',
    this.labelText,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.onTap,
    this.fillColor,
    this.maxLines = 1,
    this.alignLabelWithHint = false,
    this.textColor,
    this.style,
    this.hintText,
    this.hintColor,
    this.maxLength,

    this.onMentionAdded,
    this.onMentionRemoved,
    this.inputFormatters = const [],
    this.border,
    this.enabledBorder,
    this.disabledBorder,
    this.focusedBorder,
    this.focusedErrorBorder,
    this.errorBorder,
    this.showSuffix = true,
    this.showPrefix = true,
    this.obscuringCharacter = '•',
    this.minLines,
    this.firstDate,
    this.lastDate,
    this.initialDate,
    this.prefix,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.enabled,
    this.androidTheme,
    this.contentPadding,
    this.hintStyle,
    this.errorStyle,
    this.onSuccess,
    this.borderRadius = const BorderRadius.all(Radius.circular(15)),
    this.labelColor,
    this.cleanIconBuilder,
    this.errorFillColor,
    this.errorHeight,
    this.height,
    this.suffixIconColor,
  }) : obscureText = false,
       obsecureVisibilityToggleBuilder = null,
       autoCorrect = false,
       enableSuggestions = false,

       textInputType = TextInputType.text,
       textInputAction = TextInputAction.next,
       textCapitalization = TextCapitalization.none,
       isPassword = false,
       readOnly = true,
       focusNode = null,
       suffix = null,
       prefixText = "",
       prefixTextStyle = null,
       initialTime = null;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool isErrorState = false;
  bool isValidState = false;
  late final TextEditingController _controller;
  late BorderRadius? _borderRadius = widget.borderRadius;

  late InputBorder _validBorderStyle;

  late FocusNode _focusNode;
  bool _hasFocus = false;

  DateTime? _selectedDate;

  Widget? get suffix {
    switch (widget.textFieldType) {
      case AppTextFieldType.generic:
      case AppTextFieldType.email:
      case AppTextFieldType.password:
      case AppTextFieldType.date:
        return widget.suffix;
    }
  }

  @override
  void initState() {
    _controller = widget.controller ?? TextEditingController();

    if (widget.initialValue.isNotEmpty) {
      _controller.text = widget.initialValue;
    }

    _focusNode = widget.focusNode ?? FocusNode();

    _focusNode.addListener(_onFocusChanged);

    _selectedDate = widget.initialDate;

    _borderRadius = widget.borderRadius;
    _validBorderStyle = OutlineInputBorder(
      borderRadius: _borderRadius ?? BorderRadius.circular(8.0),
      borderSide: BorderSide(color: AppModule.I.appColors.validColor),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final fieldTheme = AppThemesProvider.of(context).textFieldTheme;

    return SizedBox(
      height: isErrorState
          ? (widget.height == null ? null : widget.height! + 10)
          : widget.height,
      child: Container(
        constraints: const BoxConstraints(minHeight: 56),
        decoration: BoxDecoration(
          // border: Border.all(
          //   color: _hasFocus
          //       ? fieldTheme.borderColor
          //       : AppModule.I.appColors.transparent,
          //   width: 1,
          // ),
          borderRadius: widget.borderRadius ?? fieldTheme.borderRadius,
        ),
        child: TextFormField(
          key: widget.key,
          controller: _controller,
          autovalidateMode:
              fieldTheme.autovalidateMode ?? AutovalidateMode.disabled,
          keyboardType: widget.textInputType,
          textInputAction: widget.textInputAction,
          obscureText: widget.obscureText,
          obscuringCharacter: widget.obscuringCharacter,
          autocorrect: widget.autoCorrect,
          enableSuggestions: widget.enableSuggestions,
          readOnly: widget.readOnly,
          validator: (value) {
            Future(() => _validateState());

            if (widget.validator != null) return widget.validator!(value);
            return null;
          },
          inputFormatters: widget.inputFormatters,
          enabled: widget.enabled,
          onChanged: widget.onChanged,
          onSaved: widget.onSaved,
          onEditingComplete: widget.onEditingComplete,
          onFieldSubmitted: widget.onFieldSubmitted,
          selectionControls:
              fieldTheme.selectionControls ?? CupertinoTextSelectionControls(),
          focusNode: _focusNode,
          onTap: () {
            if (widget.onTap != null) {
              widget.onTap!();
            } else if (widget.textFieldType == AppTextFieldType.date) {
              _onDateFocus();
            }
          },
          style: _getFieldTextStyle(fieldTheme),
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          maxLength: widget.maxLength,
          decoration: InputDecoration(
            //isDense: false,
            alignLabelWithHint: widget.alignLabelWithHint,
            filled: fieldTheme.filled ?? true,
            fillColor: _getFillColor(fieldTheme),
            //isCollapsed: true,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelText: widget.labelText,
            labelStyle: _getLabelStyle(fieldTheme),
            hintStyle: _getHintStyle(fieldTheme),
            hintText: widget.hintText,
            floatingLabelStyle: _getFloatingLabelStyle(fieldTheme),
            border: getDefaultBorder(fieldTheme),
            enabledBorder: _getEnabledBorder(fieldTheme),
            focusedBorder: _getFocusedBorder(fieldTheme),
            disabledBorder: _getDisabledBorder(fieldTheme),
            errorBorder: _getErrorBorder(fieldTheme),
            focusedErrorBorder: _getFocusedErrorBorder(fieldTheme),
            errorMaxLines: 100,
            errorStyle: (widget.errorStyle ?? fieldTheme.errorStyle)?.copyWith(
              height: widget.errorHeight,
            ),
            contentPadding:
                widget.contentPadding ??
                EdgeInsets.symmetric(
                  vertical: widget.labelText == null
                      ? AppDimensions.dimen_18
                      : AppDimensions.dimen_10,
                  horizontal: 16.0,
                ),
            prefixIcon: widget.showPrefix ? widget.prefix : null,
            suffixIcon: widget.showSuffix ? widget.suffix : null,
            prefixText: widget.prefixText,
            prefixStyle:
                widget.prefixTextStyle ??
                fieldTheme.prefixStyle ??
                AppModule.I.appStyles.text3(),
          ),
        ),
      ),
    );
  }

  TextStyle? _getFieldTextStyle(TextFieldTheme fieldTheme) {
    /// Hight Priority for the value coming in the constructor
    if (widget.style != null) return widget.style;

    /// if not passed on constructor then get the value from the theme
    if (fieldTheme.style != null) return fieldTheme.style;

    /// otherwise return the default text style
    return AppModule.I.appStyles.text3(color: widget.textColor);
  }

  InputBorder _getFocusedErrorBorder(TextFieldTheme fieldTheme) {
    /// Hight Priority for the value coming in the constructor
    if (widget.focusedErrorBorder != null) return widget.focusedErrorBorder!;

    /// if not passed on constructor then get the value from the theme
    if (fieldTheme.focusedErrorBorder != null) {
      return fieldTheme.focusedErrorBorder!;
    }

    /// otherwise return the default border
    return AppModule.I.appBorders.inputFocusedErrorBorder;
  }

  InputBorder getDefaultBorder(TextFieldTheme fieldTheme) {
    /// Hight Priority for the field validation state
    if (isValidState) return _validBorderStyle;

    /// If the validation not triggered then get the value coming in the constructor
    if (widget.border != null) return widget.border!;

    /// if not passed on constructor then get the value from the theme
    if (fieldTheme.border != null) return fieldTheme.border!;

    /// otherwise return the default border
    return AppModule.I.appBorders.inputBorder;
  }

  InputBorder _getErrorBorder(TextFieldTheme fieldTheme) {
    /// Hight Priority for the value coming in the constructor
    if (widget.errorBorder != null) return widget.errorBorder!;

    /// if not passed on constructor then get the value from the theme
    if (fieldTheme.errorBorder != null) return fieldTheme.errorBorder!;

    /// otherwise return the default border
    return AppModule.I.appBorders.inputErrorBorder;
  }

  InputBorder? _getDisabledBorder(TextFieldTheme fieldTheme) {
    /// Hight Priority for the value coming in the constructor
    if (widget.disabledBorder != null) return widget.disabledBorder;

    /// otherwise return value from the theme
    return fieldTheme.disabledBorder;
  }

  InputBorder _getFocusedBorder(TextFieldTheme fieldTheme) {
    /// Hight Priority for the field validation state
    if (isValidState) return _validBorderStyle;

    /// If the validation not triggered then get the value coming in the constructor
    if (widget.focusedBorder != null) return widget.focusedBorder!;

    /// if not passed on constructor then get the value from the theme
    if (fieldTheme.focusedBorder != null) return fieldTheme.focusedBorder!;

    /// otherwise return the default border
    return AppModule.I.appBorders.inputFocusedBorder;
  }

  InputBorder? _getEnabledBorder(TextFieldTheme fieldTheme) {
    /// Hight Priority for the field validation state
    if (isValidState) return _validBorderStyle;

    /// If the validation not triggered then get the value coming in the constructor
    if (widget.enabledBorder != null) return widget.enabledBorder;

    /// otherwise return the value from the theme
    return fieldTheme.enabledBorder ?? widget.border;
  }

  Color? _getFillColor(TextFieldTheme fieldTheme) {
    /// Hight Priority for the error state color
    if (isErrorState) {
      return widget.errorFillColor ??
          fieldTheme.errorFillColor ??
          AppModule.I.appColors.fieldErrorBGColor;
    }

    /// NextPriority for the valid state color
    if (isValidState) return AppModule.I.appColors.fieldValidBorderColor;

    /// If the validation not triggered then get the value coming in the constructor
    if (widget.fillColor != null) return widget.fillColor;

    /// otherwise return the value from the theme
    return fieldTheme.fillColor;
  }

  TextStyle _getLabelStyle(TextFieldTheme fieldTheme) {
    /// Hight Priority for the style coming from the theme
    if (fieldTheme.labelStyle != null) {
      return fieldTheme.labelStyle!.copyWith(color: widget.labelColor);
    }

    /// otherwise return the default style
    return AppModule.I.appStyles
        .text2(color: widget.labelColor ?? AppModule.I.appColors.darkTextColor)
        .copyWith(fontSize: AppFontSizes.font_18);
  }

  TextStyle _getFloatingLabelStyle(TextFieldTheme fieldTheme) {
    return fieldTheme.floatingLabelStyle ?? AppModule.I.appStyles.text3();
  }

  TextStyle _getHintStyle(TextFieldTheme fieldTheme) {
    Color? hintColor =
        widget.hintStyle?.color ??
        widget.hintColor ??
        fieldTheme.hintStyle?.color;

    /// If error state then change the opacity of the hint text
    if (isErrorState) hintColor = hintColor?.withOpacity(0.46);

    /// High Priority to the style coming from the constructor
    if (widget.hintStyle != null) {
      return widget.hintStyle!.copyWith(color: hintColor);
    }

    /// If not passed then get the style from the theme
    if (fieldTheme.hintStyle != null) {
      return fieldTheme.hintStyle!.copyWith(color: hintColor);
    }

    /// If error state then change the opacity of the hint text
    hintColor ??= isErrorState
        ? AppModule.I.appColors.darkTextColor.withOpacity(0.46)
        : AppModule.I.appColors.darkTextColor;

    /// other wise return the default style
    return AppModule.I.appStyles
        .text2(color: hintColor)
        .copyWith(fontSize: AppFontSizes.font_12);
  }

  void _onDateFocus() {
    // max age= 100 years
    final DateTime firstDate = widget.firstDate ?? DateTime.now();
    // min age = 18 years
    final DateTime lastDate =
        widget.lastDate ?? DateTime.now().add(const Duration(days: 365));

    showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: lastDate,
      initialDate: _selectedDate ?? widget.initialDate ?? firstDate,
    ).then((DateTime? selectedDate) {
      if (selectedDate != null) {
        _selectedDate = selectedDate;
        _controller.text = DateFormat('yyyy-MM-dd').format(selectedDate);
      }
    });
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChanged);

    super.dispose();
  }

  void _onFocusChanged() {
    if (_hasFocus != _focusNode.hasFocus) {
      setState(() {
        _hasFocus = _focusNode.hasFocus;
      });
    }
  }

  void _validateState() {
    if (mounted) {
      setState(() {
        if (widget.validator != null) {
          isErrorState = widget.validator!(_controller.text) != null;
        }

        if (widget.onSuccess != null) {
          isValidState = widget.onSuccess!(_controller.text);
        }
      });
    }
  }
}
