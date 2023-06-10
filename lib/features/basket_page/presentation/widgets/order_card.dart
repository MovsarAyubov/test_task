// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:test_task/core/app_colors.dart';
import 'package:test_task/core/widgets/text_widget.dart';
import 'package:test_task/features/basket_page/presentation/cubit/basket_cubit.dart';
import 'package:test_task/features/basket_page/presentation/cubit/basket_state.dart';

import '../../../../setup.dart';
import '../../../dishes_page/data/models/dish_model.dart';
import '../../../../core/widgets/size_config.dart';

class OrderCard extends StatefulWidget {
  final DishModel dish;
  final SizeConfig sizeConfig;
  const OrderCard({
    Key? key,
    required this.dish,
    required this.sizeConfig,
  }) : super(key: key);

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  String currency() {
    Locale locale = Localizations.localeOf(context);
    var format = NumberFormat.simpleCurrency(locale: locale.toString());
    return format.currencySymbol;
  }

  final basketCubit = getIt<BasketCubit>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: widget.sizeConfig.screenWidth(62),
          width: widget.sizeConfig.screenWidth(62),
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(10),
            color: greyBackgroundColor,
          ),
          alignment: Alignment.center,
          child: Image.network(widget.dish.imageUrl),
        ),
        SizedBox(width: widget.sizeConfig.screenWidth(8)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SFProText(
              widget.dish.name,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            Row(
              children: [
                SFProText(
                  "${widget.dish.price.toString()} ${currency()}",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(width: widget.sizeConfig.screenWidth(2)),
                SFProText(
                  "${widget.dish.weight.toString()}г",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black.withOpacity(0.4),
                ),
              ],
            ),
          ],
        ),
        const Expanded(child: SizedBox()),
        Container(
          height: widget.sizeConfig.screenHeight(32),
          width: widget.sizeConfig.screenWidth(99),
          decoration: BoxDecoration(
            color: greyBackgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  basketCubit.decrementAmountInBasket(widget.dish.id);
                },
                child: SizedBox(
                  height: widget.sizeConfig.screenWidth(24),
                  width: widget.sizeConfig.screenWidth(24),
                  child: const Icon(Icons.remove),
                ),
              ),
              BlocBuilder<BasketCubit, BasketState>(
                  bloc: basketCubit,
                  builder: (context, state) {
                    return SFProText(
                      basketCubit.returnAmount(widget.dish.id).toString(),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    );
                  }),
              GestureDetector(
                onTap: () {
                  basketCubit.increaseAmountInBasket(widget.dish.id);
                },
                child: SizedBox(
                  height: widget.sizeConfig.screenWidth(24),
                  width: widget.sizeConfig.screenWidth(24),
                  child: const Icon(Icons.add),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
