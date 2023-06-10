// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/core/models/currency.dart';
import 'package:test_task/features/dishes_page/presentation/widgets/expanded_button.dart';

import '../../../../core/widgets/my_navigation_bar.dart';
import '../../../../core/widgets/size_config.dart';
import '../../../../setup.dart';
import '../cubit/basket_cubit.dart';
import '../cubit/basket_state.dart';
import 'order_card.dart';

class BasketList extends StatefulWidget {
  final BasketState state;
  final SizeConfig sizeConfig;
  const BasketList({
    Key? key,
    required this.state,
    required this.sizeConfig,
  }) : super(key: key);

  @override
  State<BasketList> createState() => _BasketListState();
}

class _BasketListState extends State<BasketList> {
  final basketCubit = getIt<BasketCubit>();

  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(context);
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: widget.sizeConfig.screenWidth(16)),
      child: Column(
        children: [
          const MyNavigationBar(),
          SizedBox(height: widget.sizeConfig.screenHeight(23)),
          ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return OrderCard(
                  dish: widget.state.basket[index],
                  sizeConfig: widget.sizeConfig);
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: widget.sizeConfig.screenHeight(16));
            },
            itemCount: widget.state.basket.length,
          ),
          const Expanded(child: SizedBox()),
          BlocBuilder<BasketCubit, BasketState>(
              bloc: basketCubit,
              builder: (context, state) {
                return Padding(
                  padding: EdgeInsets.only(bottom: sizeConfig.screenHeight(16)),
                  child: ExpandedButton(
                      buttonText:
                          "${"Оплатить"} ${basketCubit.basketCost()} ${Currency.currency(context)}",
                      onTap: () {},
                      sizeConfig: widget.sizeConfig),
                );
              })
        ],
      ),
    );
  }
}
