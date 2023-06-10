import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/empty_basket.dart';
import '../../../../core/widgets/my_bottom_navigation_bar.dart';
import '../../../../core/widgets/size_config.dart';

import '../../../../setup.dart';
import '../cubit/basket_cubit.dart';
import '../cubit/basket_state.dart';
import '../widgets/basket_list.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({super.key});

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  final basketCubit = getIt<BasketCubit>();

  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(context);
    return Scaffold(
      bottomNavigationBar: const MyBottomNavigationBar(),
      body: SafeArea(
        child: BlocBuilder<BasketCubit, BasketState>(
          bloc: basketCubit,
          builder: (context, state) {
            if (state.basket.isNotEmpty) {
              return BasketList(
                state: state,
                sizeConfig: sizeConfig,
              );
            } else {
              return EmptyBasket(sizeConfig: sizeConfig);
            }
          },
        ),
      ),
    );
  }
}
