// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/cubits/switch/switch_cubit.dart';
import '../../../../core/widgets/size_config.dart';
import '../../../../core/widgets/text_widget.dart';
import '../cubit/dishes_cubit.dart';

class TegButton extends StatelessWidget {
  final DishesCubit dishesCubit;
  final SwitchCubit switchCubit;
  final String teg;
  const TegButton({
    Key? key,
    required this.dishesCubit,
    required this.switchCubit,
    required this.teg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(context);
    return GestureDetector(
      onTap: () {
        switchCubit.setTeg(teg);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: sizeConfig.screenWidth(16),
          vertical: sizeConfig.screenHeight(10),
        ),
        decoration: BoxDecoration(
          color: switchCubit.tegIsApplied(teg) ? blue : greyBackgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: SFProText(teg,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: switchCubit.tegIsApplied(teg) ? Colors.white : Colors.black),
      ),
    );
  }
}
