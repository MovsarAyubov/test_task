// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/core/app_colors.dart';
import 'package:test_task/core/widgets/size_config.dart';
import 'package:test_task/features/dishes_page/domain/entities/dish_entity.dart';

import '../../../../setup.dart';
import '../../../basket_page/presentation/cubit/basket_cubit.dart';
import '../../../basket_page/presentation/cubit/basket_state.dart';
import 'dish_image.dart';
import 'dish_info.dart';
import 'expanded_button.dart';

class DishAlert extends StatefulWidget {
  final DishEntity dish;
  const DishAlert({
    Key? key,
    required this.dish,
  }) : super(key: key);

  @override
  State<DishAlert> createState() => _DishAlertState();
}

class _DishAlertState extends State<DishAlert> {
  final basketCubit = getIt<BasketCubit>();

  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(context);
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: sizeConfig.screenHeight(232),
            width: sizeConfig.screenWidth(311),
            decoration: BoxDecoration(
              color: greyBackgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: DishImage(
              sizeConfig: sizeConfig,
              imageUrl: widget.dish.imageUrl,
            ),
          ),
          SizedBox(height: sizeConfig.screenHeight(8)),
          DishInfo(
            sizeConfig: sizeConfig,
            dish: widget.dish,
          ),
          SizedBox(height: sizeConfig.screenHeight(16)),
          BlocBuilder<BasketCubit, BasketState>(
              bloc: basketCubit,
              builder: (context, state) {
                final isInBasket = basketCubit.isInBasket(widget.dish.id);
                return ExpandedButton(
                  colorOpacity: isInBasket ? 0.5 : 1,
                  sizeConfig: sizeConfig,
                  buttonText: isInBasket ? "В корзине" : "Добавить в корзину",
                  onTap: () {
                    if (!isInBasket) {
                      basketCubit.addToBasket(widget.dish);
                    }
                  },
                );
              }),
        ],
      ),
    );
  }
}
