/*
* File : App Theme
* Version : 1.0.0
* */

/// [FxCustomTheme] - provides the different properties for the custom theme.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum FxCustomThemeType { light, dark }

class FxCustomTheme {
  Color bgLayer1,
      bgLayer2,
      border1,
      border2,
      disabledColor,
      onDisabled,
      colorInfo,
      colorWarning,
      colorSuccess,
      colorError,
      shadowColor,
      onInfo,
      onWarning,
      onSuccess,
      onError;

  Color lightBlack, red, green, yellow, orange, blue, purple, pink, brown;

  FxCustomTheme({
    this.border1 = const Color(0xffeeeeee),
    this.border2 = const Color(0xffe6e6e6),
    this.bgLayer1 = const Color(0xfff0f0f0),
    this.bgLayer2 = const Color(0xfffefefe),
    this.disabledColor = const Color(0xffdcc7ff),
    this.onDisabled = const Color(0xffffffff),
    this.colorWarning = const Color(0xffffc837),
    this.colorInfo = const Color(0xffff784b),
    this.colorSuccess = const Color(0xff3cd278),
    this.shadowColor = const Color(0xff1f1f1f),
    this.onInfo = const Color(0xffffffff),
    this.onWarning = const Color(0xffffffff),
    this.onSuccess = const Color(0xffffffff),
    this.colorError = const Color(0xfff0323c),
    this.onError = const Color(0xffffffff),

    //Color
    this.lightBlack = const Color(0xffa7a7a7),
    this.red = const Color(0xffFF0000),
    this.green = const Color(0xff008000),
    this.yellow = const Color(0xfffff44f),
    this.orange = const Color(0xffFFA500),
    this.blue = const Color(0xff0000ff),
    this.purple = const Color(0xff800080),
    this.pink = const Color(0xffFFC0CB),
    this.brown = const Color(0xffA52A2A),
  });

  static FxCustomTheme lightCustomAppTheme = FxCustomTheme(
    bgLayer1: const Color(0xfff6f6f6),
    bgLayer2: const Color(0xffffffff),
    disabledColor: const Color(0xff636363),
    onDisabled: const Color(0xffffffff),
    colorInfo: const Color(0xffff784b),
    colorWarning: const Color(0xffffc837),
    colorSuccess: const Color(0xff3cd278),
    shadowColor: const Color(0xffd9d9d9),
    onInfo: const Color(0xffffffff),
    onSuccess: const Color(0xffffffff),
    onWarning: const Color(0xffffffff),
    colorError: const Color(0xfff0323c),
    onError: const Color(0xffffffff),
  );

  static FxCustomTheme darkCustomAppTheme = FxCustomTheme(
      bgLayer1: const Color(0xff1b1b1b),
      bgLayer2: const Color(0xff252525),
      border1: const Color(0xff303030),
      border2: const Color(0xff363636),
      disabledColor: const Color(0xffbababa),
      onDisabled: const Color(0xff000000),
      colorInfo: const Color(0xffff784b),
      colorWarning: const Color(0xffffc837),
      colorSuccess: const Color(0xff3cd278),
      shadowColor: const Color(0xff202020),
      onInfo: const Color(0xffffffff),
      onSuccess: const Color(0xffffffff),
      onWarning: const Color(0xffffffff),
      colorError: const Color(0xfff0323c),
      onError: const Color(0xffffffff));

  static FxCustomThemeType defaultThemeType = FxCustomThemeType.light;

  static FxCustomTheme getCustomAppTheme({FxCustomThemeType? themeType}) {
    themeType ??= defaultThemeType;

    switch (themeType) {
      case FxCustomThemeType.light:
        return lightCustomAppTheme;
      default:
        return darkCustomAppTheme;
    }
  }

  static void changeLightTheme(FxCustomTheme themeData) {
    lightCustomAppTheme = themeData;
  }

  static void changeDarkTheme(FxCustomTheme themeData) {
    darkCustomAppTheme = themeData;
  }

  static void changeThemeType(FxCustomThemeType? themeType) {
    defaultThemeType = themeType!;
  }
}
