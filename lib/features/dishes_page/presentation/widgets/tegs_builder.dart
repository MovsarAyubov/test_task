// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cubits/switch/switch_cubit.dart';
import '../../../../core/cubits/switch/switch_state.dart';
import '../../../../core/widgets/size_config.dart';
import '../../../../setup.dart';
import '../cubit/dishes_cubit.dart';
import 'teg_button.dart';

class TegBuilder extends StatefulWidget {
  const TegBuilder({
    Key? key,
  }) : super(key: key);

  @override
  State<TegBuilder> createState() => _TegBuilderState();
}

class _TegBuilderState extends State<TegBuilder> {
  List<String> tegs = [
    "Все меню",
    "Салаты",
    "С рисом",
    "С рыбой",
  ];

  final switchCubit = getIt<SwitchCubit>();
  final dishesCubit = getIt<DishesCubit>();

  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(context);
    return BlocBuilder<SwitchCubit, SwitchState>(
        bloc: switchCubit,
        builder: (context, state) {
          return SizedBox(
            height: sizeConfig.screenHeight(38),
            child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return TegButton(
                    dishesCubit: dishesCubit,
                    switchCubit: switchCubit,
                    teg: tegs[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: sizeConfig.screenWidth(8));
                },
                itemCount: 4),
          );
        });
  }
}
