// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:test_task/core/app_colors.dart';
import 'package:test_task/core/widgets/size_config.dart';
import 'package:test_task/core/widgets/text_widget.dart';
import 'package:test_task/features/dishes_page/domain/entities/dish_entity.dart';

import 'dish_dialog.dart';

class DishCard extends StatelessWidget {
  final DishEntity dish;
  const DishCard({
    Key? key,
    required this.dish,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(context);
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => DishAlert(
                  dish: dish,
                ));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: sizeConfig.screenWidth(109),
            width: sizeConfig.screenWidth(109),
            padding: EdgeInsets.symmetric(
                horizontal: sizeConfig.screenWidth(14),
                vertical: sizeConfig.screenHeight(14)),
            decoration: BoxDecoration(
              color: greyBackgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: Image.network(dish.imageUrl),
          ),
          SizedBox(height: sizeConfig.screenHeight(5)),
          SFProText(
            dish.name,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
