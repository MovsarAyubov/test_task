// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../core/widgets/my_navigation_bar.dart';
import '../../../../core/widgets/size_config.dart';
import '../cubit/basket_state.dart';
import 'order_card.dart';

class BasketList extends StatelessWidget {
  final BasketState state;
  final SizeConfig sizeConfig;
  const BasketList({
    Key? key,
    required this.state,
    required this.sizeConfig,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sizeConfig.screenWidth(16)),
      child: Column(
        children: [
          const MyNavigationBar(),
          SizedBox(height: sizeConfig.screenHeight(23)),
          ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return OrderCard(
                  dish: state.basket[index], sizeConfig: sizeConfig);
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: sizeConfig.screenHeight(16));
            },
            itemCount: state.basket.length,
          )
        ],
      ),
    );
  }
}
