// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../cubit/categories_state.dart';
import 'category_card.dart';

class ItemsBuilder extends StatefulWidget {
  final LoadedState state;
  const ItemsBuilder({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  State<ItemsBuilder> createState() => _ItemsBuilderState();
}

class _ItemsBuilderState extends State<ItemsBuilder> {
  List<Color> boxColors = [
    const Color.fromRGBO(255, 242, 210, 1),
    const Color.fromRGBO(255, 235, 224, 1),
    const Color.fromRGBO(216, 245, 243, 1),
    const Color.fromRGBO(239, 245, 207, 1),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) => CategoryCard(
          categoryItem: widget.state.categories[index],
          boxColor: boxColors[index],
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: 8,
        ),
        itemCount: widget.state.categories.length,
      ),
    );
  }
}
