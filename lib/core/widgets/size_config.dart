// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SizeConfig {
  final BuildContext context;
  final double inputPx;
  const SizeConfig(
    this.context, [
    this.inputPx = 0,
  ]);

  double screenHeight(double inputPx) {
    double screenHeight = MediaQuery.of(context).size.height;
    return (inputPx / 812.0) * screenHeight;
  }

  double screenWidth(double inputPx) {
    double screenWidth = MediaQuery.of(context).size.width;
    return (inputPx / 375.0) * screenWidth;
  }
}
