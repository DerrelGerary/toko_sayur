/// There are mainly 13 types of Text widgets.
/// h1,h2,h3,h4,h5,h6,sh1,sh2,b1,b2,button,caption,overline - This is the order of its size.

// ignore_for_file: use_key_in_widget_constructors

import 'package:derel_grocy/themes/text_style.dart';
import 'package:flutter/material.dart';

class FxText extends StatelessWidget {
  //Key

  @override
  // ignore: overridden_fields
  final Key? key;

  final String text;
  final TextStyle? textStyle;
  final int fontWeight;
  final bool muted, xMuted;
  final double? letterSpacing;
  final Color? color;
  final TextDecoration decoration;
  final double? height;
  final double wordSpacing;
  final double? fontSize;
  final FxTextSize fxTextSize;

  //Text Style
  final TextAlign? textAlign;
  final int? maxLines;
  final Locale? locale;
  final TextOverflow? overflow;
  final String? semanticsLabel;
  final bool? softWrap;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final TextHeightBehavior? textHeightBehavior;
  final double? textScaleFactor;
  final TextWidthBasis? textWidthBasis;

  const FxText(this.text,
      {this.textStyle,
      this.fontWeight = 500,
      this.muted = false,
      this.xMuted = false,
      this.letterSpacing = 0.15,
      this.color,
      this.decoration = TextDecoration.none,
      this.height,
      this.wordSpacing = 0,
      this.fontSize,
      this.fxTextSize = FxTextSize.b1,
      this.key,
      this.textAlign,
      this.maxLines,
      this.locale,
      this.overflow,
      this.semanticsLabel,
      this.softWrap,
      this.strutStyle,
      this.textDirection,
      this.textHeightBehavior,
      this.textScaleFactor,
      this.textWidthBasis});

  const FxText.h1(this.text,
      {this.textStyle,
      this.fontWeight = 500,
      this.muted = false,
      this.xMuted = false,
      this.letterSpacing,
      this.color,
      this.decoration = TextDecoration.none,
      this.height,
      this.wordSpacing = 0,
      this.fontSize,
      this.fxTextSize = FxTextSize.h1,
      this.key,
      this.textAlign,
      this.maxLines,
      this.locale,
      this.overflow,
      this.semanticsLabel,
      this.softWrap,
      this.strutStyle,
      this.textDirection,
      this.textHeightBehavior,
      this.textScaleFactor,
      this.textWidthBasis});

  const FxText.h2(this.text,
      {this.textStyle,
      this.fontWeight = 500,
      this.muted = false,
      this.xMuted = false,
      this.letterSpacing,
      this.color,
      this.decoration = TextDecoration.none,
      this.height,
      this.wordSpacing = 0,
      this.fontSize,
      this.fxTextSize = FxTextSize.h2,
      this.key,
      this.textAlign,
      this.maxLines,
      this.locale,
      this.overflow,
      this.semanticsLabel,
      this.softWrap,
      this.strutStyle,
      this.textDirection,
      this.textHeightBehavior,
      this.textScaleFactor,
      this.textWidthBasis});

  const FxText.h3(this.text,
      {this.textStyle,
      this.fontWeight = 500,
      this.muted = false,
      this.xMuted = false,
      this.letterSpacing,
      this.color,
      this.decoration = TextDecoration.none,
      this.height,
      this.wordSpacing = 0,
      this.fontSize,
      this.fxTextSize = FxTextSize.h3,
      this.key,
      this.textAlign,
      this.maxLines,
      this.locale,
      this.overflow,
      this.semanticsLabel,
      this.softWrap,
      this.strutStyle,
      this.textDirection,
      this.textHeightBehavior,
      this.textScaleFactor,
      this.textWidthBasis});

  const FxText.h4(this.text,
      {this.textStyle,
      this.fontWeight = 500,
      this.muted = false,
      this.xMuted = false,
      this.letterSpacing,
      this.color,
      this.decoration = TextDecoration.none,
      this.height,
      this.wordSpacing = 0,
      this.fontSize,
      this.fxTextSize = FxTextSize.h4,
      this.key,
      this.textAlign,
      this.maxLines,
      this.locale,
      this.overflow,
      this.semanticsLabel,
      this.softWrap,
      this.strutStyle,
      this.textDirection,
      this.textHeightBehavior,
      this.textScaleFactor,
      this.textWidthBasis});

  const FxText.h5(this.text,
      {this.textStyle,
      this.fontWeight = 500,
      this.muted = false,
      this.xMuted = false,
      this.letterSpacing,
      this.color,
      this.decoration = TextDecoration.none,
      this.height,
      this.wordSpacing = 0,
      this.fontSize,
      this.fxTextSize = FxTextSize.h5,
      this.key,
      this.textAlign,
      this.maxLines,
      this.locale,
      this.overflow,
      this.semanticsLabel,
      this.softWrap,
      this.strutStyle,
      this.textDirection,
      this.textHeightBehavior,
      this.textScaleFactor,
      this.textWidthBasis});

  const FxText.h6(this.text,
      {this.textStyle,
      this.fontWeight = 500,
      this.muted = false,
      this.xMuted = false,
      this.letterSpacing,
      this.color,
      this.decoration = TextDecoration.none,
      this.height,
      this.wordSpacing = 0,
      this.fontSize,
      this.fxTextSize = FxTextSize.h6,
      this.key,
      this.textAlign,
      this.maxLines,
      this.locale,
      this.overflow,
      this.semanticsLabel,
      this.softWrap,
      this.strutStyle,
      this.textDirection,
      this.textHeightBehavior,
      this.textScaleFactor,
      this.textWidthBasis});

  const FxText.sh1(this.text,
      {this.textStyle,
      this.fontWeight = 500,
      this.muted = false,
      this.xMuted = false,
      this.letterSpacing,
      this.color,
      this.decoration = TextDecoration.none,
      this.height,
      this.wordSpacing = 0,
      this.fontSize,
      this.fxTextSize = FxTextSize.sh1,
      this.key,
      this.textAlign,
      this.maxLines,
      this.locale,
      this.overflow,
      this.semanticsLabel,
      this.softWrap,
      this.strutStyle,
      this.textDirection,
      this.textHeightBehavior,
      this.textScaleFactor,
      this.textWidthBasis});

  const FxText.sh2(this.text,
      {this.textStyle,
      this.fontWeight = 500,
      this.muted = false,
      this.xMuted = false,
      this.letterSpacing,
      this.color,
      this.decoration = TextDecoration.none,
      this.height,
      this.wordSpacing = 0,
      this.fontSize,
      this.fxTextSize = FxTextSize.sh2,
      this.key,
      this.textAlign,
      this.maxLines,
      this.locale,
      this.overflow,
      this.semanticsLabel,
      this.softWrap,
      this.strutStyle,
      this.textDirection,
      this.textHeightBehavior,
      this.textScaleFactor,
      this.textWidthBasis});

  const FxText.b1(this.text,
      {this.textStyle,
      this.fontWeight = 500,
      this.muted = false,
      this.xMuted = false,
      this.letterSpacing,
      this.color,
      this.decoration = TextDecoration.none,
      this.height,
      this.wordSpacing = 0,
      this.fontSize,
      this.fxTextSize = FxTextSize.b1,
      this.key,
      this.textAlign,
      this.maxLines,
      this.locale,
      this.overflow,
      this.semanticsLabel,
      this.softWrap,
      this.strutStyle,
      this.textDirection,
      this.textHeightBehavior,
      this.textScaleFactor,
      this.textWidthBasis});

  const FxText.b2(this.text,
      {this.textStyle,
      this.fontWeight = 500,
      this.muted = false,
      this.xMuted = false,
      this.letterSpacing,
      this.color,
      this.decoration = TextDecoration.none,
      this.height,
      this.wordSpacing = 0,
      this.fontSize,
      this.fxTextSize = FxTextSize.b2,
      this.key,
      this.textAlign,
      this.maxLines,
      this.locale,
      this.overflow,
      this.semanticsLabel,
      this.softWrap,
      this.strutStyle,
      this.textDirection,
      this.textHeightBehavior,
      this.textScaleFactor,
      this.textWidthBasis});

  const FxText.button(this.text,
      {this.textStyle,
      this.fontWeight = 500,
      this.muted = false,
      this.xMuted = false,
      this.letterSpacing,
      this.color,
      this.decoration = TextDecoration.none,
      this.height,
      this.wordSpacing = 0,
      this.fontSize,
      this.fxTextSize = FxTextSize.button,
      this.key,
      this.textAlign,
      this.maxLines,
      this.locale,
      this.overflow,
      this.semanticsLabel,
      this.softWrap,
      this.strutStyle,
      this.textDirection,
      this.textHeightBehavior,
      this.textScaleFactor,
      this.textWidthBasis});

  const FxText.caption(this.text,
      {this.textStyle,
      this.fontWeight = 500,
      this.muted = false,
      this.xMuted = false,
      this.letterSpacing,
      this.color,
      this.decoration = TextDecoration.none,
      this.height,
      this.wordSpacing = 0,
      this.fontSize,
      this.fxTextSize = FxTextSize.caption,
      this.key,
      this.textAlign,
      this.maxLines,
      this.locale,
      this.overflow,
      this.semanticsLabel,
      this.softWrap,
      this.strutStyle,
      this.textDirection,
      this.textHeightBehavior,
      this.textScaleFactor,
      this.textWidthBasis});

  const FxText.overline(this.text,
      {this.textStyle,
      this.fontWeight = 500,
      this.muted = false,
      this.xMuted = false,
      this.letterSpacing,
      this.color,
      this.decoration = TextDecoration.none,
      this.height,
      this.wordSpacing = 0,
      this.fontSize,
      this.fxTextSize = FxTextSize.overline,
      this.key,
      this.textAlign,
      this.maxLines,
      this.locale,
      this.overflow,
      this.semanticsLabel,
      this.softWrap,
      this.strutStyle,
      this.textDirection,
      this.textHeightBehavior,
      this.textScaleFactor,
      this.textWidthBasis});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: FxTextStyle.getStyle(
        textStyle: textStyle,
        color: color,
        fontWeight: fontWeight,
        muted: muted,
        letterSpacing: letterSpacing ??
            FxTextStyle.defaultLetterSpacing[fxTextSize] ??
            0.15,
        height: height,
        xMuted: xMuted,
        decoration: decoration,
        wordSpacing: wordSpacing,
        fontSize: fontSize ?? FxTextStyle.defaultTextSize[fxTextSize],
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      locale: locale,
      overflow: overflow,
      semanticsLabel: semanticsLabel,
      softWrap: softWrap,
      strutStyle: strutStyle,
      textDirection: textDirection,
      textHeightBehavior: textHeightBehavior,
      textScaleFactor: textScaleFactor,
      textWidthBasis: textWidthBasis,
      key: key,
    );
  }
}