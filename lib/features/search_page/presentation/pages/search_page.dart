import 'package:flutter/material.dart';
import 'package:test_task/core/widgets/my_bottom_navigation_bar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MyBottomNavigationBar(),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
