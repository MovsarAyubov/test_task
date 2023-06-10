// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:test_task/core/widgets/size_config.dart';

class SquareButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const SquareButton({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: sizeConfig.screenWidth(40),
        width: sizeConfig.screenWidth(40),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Icon(
          icon,
        ),
      ),
    );
  }
}
