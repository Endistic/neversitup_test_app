import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  //private constructor
  const AppTheme._();

  static final light = FlexThemeData.light(
      useMaterial3: true,
      scheme: FlexScheme.amber,
      //surfaceMode: FlexSurfaceMode.highScaffoldLowSurfacesVariantDialog,

      blendLevel: 40,
      background: Colors.white,
      appBarStyle: FlexAppBarStyle.primary,
      appBarOpacity: 0.95,
      appBarElevation: 0,
      transparentStatusBar: true,
      tabBarStyle: FlexTabBarStyle.forBackground,
      tooltipsMatchBackground: true,
      swapColors: true,
      colorScheme: const ColorScheme.dark(),
      lightIsWhite: true,
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      appBarBackground: Colors.white,
      subThemesData: const FlexSubThemesData(
        useTextTheme: true,
        fabUseShape: true,
        interactionEffects: true,
        bottomNavigationBarElevation: 0,
        bottomNavigationBarOpacity: 1,
        navigationBarOpacity: 1,
        navigationBarMutedUnselectedIcon: true,
        inputDecoratorIsFilled: true,
        inputDecoratorBorderType: FlexInputBorderType.outline,
        inputDecoratorRadius: 32,
        inputDecoratorUnfocusedHasBorder: false,
        blendOnColors: true,
        blendTextTheme: true,
        popupMenuOpacity: 0.95,
        bottomSheetBackgroundColor: SchemeColor.primary,
        appBarCenterTitle: true,
      ));
}
