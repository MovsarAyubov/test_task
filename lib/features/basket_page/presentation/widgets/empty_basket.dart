// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:test_task/core/widgets/size_config.dart';

import '../../../../core/widgets/my_navigation_bar.dart';
import '../../../../core/widgets/text_widget.dart';

class EmptyBasket extends StatelessWidget {
  final SizeConfig sizeConfig;
  const EmptyBasket({
    Key? key,
    required this.sizeConfig,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sizeConfig.screenWidth(16)),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyNavigationBar(),
          SFProText(
            "Корзина пуста",
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(),
        ],
      ),
    );
  }
}
