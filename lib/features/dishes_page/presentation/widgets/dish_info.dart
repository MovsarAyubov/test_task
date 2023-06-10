// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:test_task/core/widgets/size_config.dart';
import 'package:test_task/core/widgets/text_widget.dart';
import 'package:test_task/features/dishes_page/domain/entities/dish_entity.dart';

import '../../../../core/models/currency.dart';

class DishInfo extends StatefulWidget {
  final SizeConfig sizeConfig;
  final DishEntity dish;
  const DishInfo({
    Key? key,
    required this.sizeConfig,
    required this.dish,
  }) : super(key: key);

  @override
  State<DishInfo> createState() => _DishInfoState();
}

class _DishInfoState extends State<DishInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SFProText(
          widget.dish.name,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(height: widget.sizeConfig.screenHeight(8)),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SFProText(
              "${widget.dish.price.toString()} ${Currency.currency(context)}",
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(width: widget.sizeConfig.screenWidth(4)),
            SFProText(
              "${widget.dish.weight.toString()}г",
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black.withOpacity(0.4),
            ),
            SizedBox(width: widget.sizeConfig.screenWidth(4)),
          ],
        ),
        SFProText(
          widget.dish.description,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.black.withOpacity(0.65),
        )
      ],
    );
  }
}
