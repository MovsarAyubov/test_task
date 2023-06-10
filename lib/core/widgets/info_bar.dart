// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:test_task/core/widgets/size_config.dart';
import 'package:test_task/core/widgets/text_widget.dart';
import 'package:test_task/core/widgets/user_avatar.dart';

class InfoBar extends StatelessWidget {
  final String categoryName;
  const InfoBar({
    Key? key,
    required this.categoryName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: SizedBox(
            height: sizeConfig.screenWidth(32),
            width: sizeConfig.screenWidth(32),
            child: const Icon(Icons.arrow_back_ios_new),
          ),
        ),
        SFProText(
          categoryName,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        const UserAvatar()
      ],
    );
  }
}
