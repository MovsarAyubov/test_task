import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_task/core/app_colors.dart';
import 'package:test_task/core/widgets/size_config.dart';
import 'package:test_task/core/widgets/user_avatar.dart';

import 'text_widget.dart';

class MyNavigationBar extends StatelessWidget {
  const MyNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: sizeConfig.screenHeight(5)),
              child: SizedBox(
                height: sizeConfig.screenHeight(24),
                width: sizeConfig.screenWidth(24),
                child: SvgPicture.asset(
                  "assets/images/location.svg",
                  height: sizeConfig.screenHeight(18),
                  width: sizeConfig.screenWidth(15),
                ),
              ),
            ),
            SizedBox(width: sizeConfig.screenWidth(8)),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SFProText(
                  "Санкт-Петербург",
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                SFProText(
                  "12 Августа, 2023",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: lightGrey,
                )
              ],
            ),
          ],
        ),
        const UserAvatar()
      ],
    );
  }
}
