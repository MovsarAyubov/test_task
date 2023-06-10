import 'package:flutter/material.dart';
import 'size_config.dart';
import 'user_avatar.dart';

import '../../../core/widgets/text_widget.dart';

class MyErrorWidget extends StatelessWidget {
  const MyErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sizeConfig.screenWidth(16)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back_ios_new_rounded),
              ),
              const UserAvatar(),
            ],
          ),
          const SFProText(
            "Ошибка",
            fontSize: 18,
          ),
          const SizedBox(),
        ],
      ),
    );
  }
}
