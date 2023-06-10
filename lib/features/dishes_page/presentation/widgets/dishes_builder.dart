// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/core/cubits/switch/switch_cubit.dart';
import 'package:test_task/core/widgets/size_config.dart';

import '../../../../core/cubits/switch/switch_state.dart';
import '../../../../setup.dart';
import '../cubit/dishes_cubit.dart';
import '../cubit/dishes_state.dart';
import 'dish_card.dart';

class DishesBuilder extends StatefulWidget {
  final DishesLoadedState state;
  const DishesBuilder({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  State<DishesBuilder> createState() => _DishesBuilderState();
}

class _DishesBuilderState extends State<DishesBuilder> {
  final switchCubit = getIt<SwitchCubit>();
  final dishesCubit = getIt<DishesCubit>();

  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(context);
    return Expanded(
      child: BlocBuilder<SwitchCubit, SwitchState>(
          bloc: switchCubit,
          builder: (context, switchState) {
            var dishes = dishesCubit.sortDishesByTag(
                dishes: widget.state.dishes, teg: switchState.teg);
            return GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: sizeConfig.screenHeight(5),
                crossAxisSpacing: sizeConfig.screenWidth(8),
                childAspectRatio: 1 / 1.45,
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) {
                return DishCard(dish: dishes[index]);
              },
              itemCount: dishes.length,
            );
          }),
    );
  }
}
