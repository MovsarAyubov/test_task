// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:test_task/core/app_colors.dart';
import 'package:test_task/core/widgets/text_widget.dart';

import '../../../../core/widgets/size_config.dart';

class ExpandedButton extends StatelessWidget {
  final double colorOpacity;
  final String buttonText;
  final VoidCallback onTap;
  final SizeConfig sizeConfig;
  const ExpandedButton({
    Key? key,
    this.colorOpacity = 1,
    required this.buttonText,
    required this.onTap,
    required this.sizeConfig,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: sizeConfig.screenHeight(48),
              decoration: BoxDecoration(
                color: blue.withOpacity(colorOpacity),
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: SFProText(
                buttonText,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
