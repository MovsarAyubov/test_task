// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../core/widgets/info_bar.dart';
import '../../../../core/widgets/size_config.dart';
import '../cubit/dishes_state.dart';
import 'dishes_builder.dart';
import 'tegs_builder.dart';

class DishesPageContent extends StatefulWidget {
  final DishesLoadedState state;
  const DishesPageContent({Key? key, required this.state}) : super(key: key);

  @override
  State<DishesPageContent> createState() => _DishesPageContentState();
}

class _DishesPageContentState extends State<DishesPageContent> {
  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sizeConfig.screenWidth(16)),
      child: Column(
        children: [
          const InfoBar(categoryName: "Азиатская кухня"),
          SizedBox(height: sizeConfig.screenHeight(8)),
          const TegBuilder(),
          SizedBox(height: sizeConfig.screenHeight(16)),
          DishesBuilder(state: widget.state)
        ],
      ),
    );
  }
}
