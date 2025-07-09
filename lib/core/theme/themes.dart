import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../app_module.dart';

/// Abstract class for defining app themes.
/// This class provides a method to create a default theme for the app.
/// It can be extended to create custom themes as needed.
/// The default theme includes properties such as brightness, colors,
/// text styles, and app bar theme.
abstract class AppThemes {
  ThemeData defaultTheme({bool useMaterial3 = true}) => ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppModule.I.appColors.canvasColor,
    primaryColor: AppModule.I.appColors.primaryColor,
    canvasColor: AppModule.I.appColors.canvasColor,
    hintColor: AppModule.I.appColors.canvasColor,
    splashColor: AppModule.I.appColors.canvasColor.withOpacity(0.3),
    highlightColor: AppModule.I.appColors.darkTextColor.withOpacity(0.2),
    colorScheme: ColorScheme.dark(
      primary: AppModule.I.appColors.primaryColor,
      secondary: AppModule.I.appColors.white,
      onPrimary: AppModule.I.appColors.white,
      onSecondary: AppModule.I.appColors.white,
      onSurface: AppModule.I.appColors.darkTextColor,
      surface: AppModule.I.appColors.darkCanvasColor,
      brightness: Brightness.light,
      error: AppModule.I.appColors.redShades.shade60,
    ),
    fontFamily: AppModule.I.defaultFontFamily,
    textTheme: TextTheme(
      displayLarge: AppModule.I.appStyles.header1(),
      displayMedium: AppModule.I.appStyles.header2(),
      displaySmall: AppModule.I.appStyles.header3(),
      headlineLarge: AppModule.I.appStyles.header4(),
      headlineMedium: AppModule.I.appStyles.header5(),
      bodyLarge: AppModule.I.appStyles.text1(),
      bodyMedium: AppModule.I.appStyles.text3(),
      bodySmall: AppModule.I.appStyles.text3(),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppModule.I.appColors.primaryColor,
    ),
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      // 2
      elevation: 0,
      backgroundColor: AppModule.I.appColors.transparent,
      shadowColor: AppModule.I.appColors.transparent,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppModule.I.appColors.primaryColor),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    cupertinoOverrideTheme: CupertinoThemeData(
      textTheme: CupertinoTextThemeData(
        dateTimePickerTextStyle: AppModule.I.appStyles.text2(),
      ),
    ),
    useMaterial3: useMaterial3,
  );
}

/// Default App Themes instance.
class DefaultAppThemes extends AppThemes {
  DefaultAppThemes._();

  static final DefaultAppThemes _instance = DefaultAppThemes._();
  static DefaultAppThemes get I => _instance;
}

/// AppActionButton Theme
/// This class defines the theme for action buttons in the app.
class ActionButtonTheme {
  final Color backgroundColor;
  final bool withBorder;
  final TextStyle? textStyle;
  final BorderRadius? borderRadius;
  final bool enableGradient;
  final bool fitsFullWidth;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? actionTextColor;
  final TextDecoration? actionTextDecoration;
  final FontWeight actionTextWeight;
  final List<BoxShadow>? boxShadow;
  final Color? borderColor;
  final Color? splashColor;
  final double? actionTextSize;
  final Color loaderColor;
  final Gradient? backgroundGradient;
  final Color? disabledColor;

  ActionButtonTheme({
    Color? backgroundColor,
    Color? loaderColor,
    TextStyle? textStyle,
    this.withBorder = false,
    this.borderRadius,
    this.enableGradient = false,
    this.fitsFullWidth = true,
    this.padding,
    this.margin,
    this.actionTextColor,
    this.actionTextDecoration,
    this.actionTextWeight = FontWeight.w600,
    this.boxShadow,
    this.borderColor,
    this.splashColor,
    this.actionTextSize,
    this.backgroundGradient,
    this.disabledColor,
  }) : backgroundColor = backgroundColor ?? AppModule.I.appColors.primaryColor,
       loaderColor = loaderColor ?? AppModule.I.appColors.white,
       textStyle =
           textStyle ??
           AppModule.I.appStyles
               .text3(color: actionTextColor ?? AppModule.I.appColors.white)
               .copyWith(
                 decoration: actionTextDecoration,
                 fontWeight: actionTextWeight,
                 fontSize: actionTextSize,
               );
  ActionButtonTheme copyWith({
    Color? backgroundColor,
    Color? loaderColor,
    bool? withBorder,
    BorderRadius? borderRadius,
    bool? enableGradient,
    bool? fitsFullWidth,
    EdgeInsets? padding,
    EdgeInsets? margin,
    Color? actionTextColor,
    TextDecoration? actionTextDecoration,
    FontWeight? actionTextWeight,
    List<BoxShadow>? boxShadow,
    Color? borderColor,
    Color? splashColor,
    double? actionTextSize,
    Gradient? backgroundGradient,
    TextStyle? textStyle,
    Color? disabledColor,
  }) {
    return ActionButtonTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      loaderColor: loaderColor ?? this.loaderColor,
      withBorder: withBorder ?? this.withBorder,
      borderRadius: borderRadius ?? this.borderRadius,
      enableGradient: enableGradient ?? this.enableGradient,
      fitsFullWidth: fitsFullWidth ?? this.fitsFullWidth,
      padding: padding ?? this.padding,
      margin: margin ?? this.margin,
      actionTextColor: actionTextColor ?? this.actionTextColor,
      actionTextWeight: actionTextWeight ?? this.actionTextWeight,
      boxShadow: boxShadow ?? this.boxShadow,
      borderColor: borderColor ?? this.borderColor,
      splashColor: splashColor ?? this.splashColor,
      actionTextSize: actionTextSize ?? this.actionTextSize,
      backgroundGradient: backgroundGradient ?? this.backgroundGradient,
      textStyle: textStyle ?? this.textStyle,
      disabledColor: disabledColor ?? this.disabledColor,
    );
  }
}

/// TextFields Theme
class TextFieldTheme {
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? disabledBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final Color borderColor;
  final BorderRadius? borderRadius;
  final AutovalidateMode? autovalidateMode;
  final TextSelectionControls? selectionControls;
  final TextStyle? style;
  final bool? filled;
  final Color? fillColor;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? floatingLabelStyle;
  final TextStyle? prefixStyle;
  final TextStyle? errorStyle;
  final Color? hintColor;
  final Color? errorFillColor;
  final Widget Function(bool, {VoidCallback? onClean})? cleanIconBuilder;
  final Color? suffixIconColor;

  const TextFieldTheme({
    this.border,
    this.focusedBorder,
    this.enabledBorder,
    this.disabledBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    this.borderColor = Colors.black,
    this.borderRadius,
    this.autovalidateMode,
    this.selectionControls,
    this.style,
    this.filled,
    this.fillColor,
    this.labelStyle,
    this.hintStyle,
    this.floatingLabelStyle,
    this.prefixStyle,
    this.errorStyle,
    this.hintColor,
    this.errorFillColor,
    this.cleanIconBuilder,
    this.suffixIconColor,
  });

  TextFieldTheme copyWidth({
    InputBorder? border,
    InputBorder? focusedBorder,
    InputBorder? enabledBorder,
    InputBorder? disabledBorder,
    InputBorder? errorBorder,
    InputBorder? focusedErrorBorder,
    Color? borderColor,
    BorderRadius? borderRadius,
    AutovalidateMode? autovalidateMode,
    TextSelectionControls? selectionControls,
    TextStyle? style,
    bool? filled,
    Color? fillColor,
    TextStyle? labelStyle,
    TextStyle? hintStyle,
    TextStyle? floatingLabelStyle,
    TextStyle? prefixStyle,
    TextStyle? errorStyle,
    Color? hintColor,
    Color? errorFillColor,
    Widget Function(bool, {VoidCallback? onClean})? cleanIconBuilder,
    Color? suffixIconColor,
  }) {
    return TextFieldTheme(
      border: border ?? this.border,
      focusedBorder: focusedBorder ?? this.focusedBorder,
      enabledBorder: enabledBorder ?? this.enabledBorder,
      disabledBorder: disabledBorder ?? this.disabledBorder,
      errorBorder: errorBorder ?? this.errorBorder,
      focusedErrorBorder: focusedErrorBorder ?? this.focusedErrorBorder,
      borderColor: borderColor ?? this.borderColor,
      borderRadius: borderRadius ?? this.borderRadius,
      autovalidateMode: autovalidateMode ?? this.autovalidateMode,
      selectionControls: selectionControls ?? this.selectionControls,
      style: style ?? this.style,
      filled: filled ?? this.filled,
      fillColor: fillColor ?? this.fillColor,
      labelStyle: labelStyle ?? this.labelStyle,
      hintStyle: hintStyle ?? this.hintStyle,
      floatingLabelStyle: floatingLabelStyle ?? this.floatingLabelStyle,
      prefixStyle: prefixStyle ?? this.prefixStyle,
      errorStyle: errorStyle ?? this.errorStyle,
      hintColor: hintColor ?? this.hintColor,
      errorFillColor: errorFillColor ?? this.errorFillColor,
      cleanIconBuilder: cleanIconBuilder ?? this.cleanIconBuilder,
      suffixIconColor: suffixIconColor ?? this.suffixIconColor,
    );
  }
}

/// AppScaffold Theme
/// This class defines the theme for the app's scaffold.
class AppScaffoldTheme {
  final Color? backgroundColor;
  final Gradient? Function(double?)? backgroundGradientBuilder;
  final double backgroundGradientOpacity;
  final bool animateGradient;
  final int gradientStart;

  AppScaffoldTheme({
    this.backgroundColor,
    this.backgroundGradientBuilder,
    this.backgroundGradientOpacity = 0.15,
    this.animateGradient = false,
    this.gradientStart = 0,
  });

  AppScaffoldTheme copyWith({
    Color? backgroundColor,
    Gradient? Function(double?)? backgroundGradientBuilder,
    double? backgroundGradientOpacity,
    bool? animateGradient,
    int? gradientStart,
  }) {
    return AppScaffoldTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      backgroundGradientBuilder:
          backgroundGradientBuilder ?? this.backgroundGradientBuilder,
      backgroundGradientOpacity:
          backgroundGradientOpacity ?? this.backgroundGradientOpacity,
      animateGradient: animateGradient ?? this.animateGradient,
      gradientStart: gradientStart ?? this.gradientStart,
    );
  }
}
