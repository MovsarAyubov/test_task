import 'package:flutter/material.dart';

import '../app_colors.dart';
import 'size_config.dart';

class SFProText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final double fontSize;
  final Color? color;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  const SFProText(
    this.text, {
    super.key,
    this.textAlign,
    this.fontWeight,
    this.fontSize = 18,
    this.color = black,
    this.maxLines,
    this.overflow = TextOverflow.clip,
  });

  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(context);
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          fontSize: sizeConfig.screenWidth(fontSize),
          fontWeight: fontWeight,
          color: color,
          fontFamily: "SF Pro Display"),
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
