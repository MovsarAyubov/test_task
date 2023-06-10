// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:test_task/core/widgets/my_navigation_bar.dart';

import '../cubit/categories_state.dart';
import 'items_builder.dart';

class Home extends StatelessWidget {
  final LoadedState state;
  const Home({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MyNavigationBar(),
        const SizedBox(height: 8),
        ItemsBuilder(state: state),
      ],
    );
  }
}
