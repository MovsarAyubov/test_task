import 'package:flutter/material.dart';
import 'package:test_task/core/widgets/my_bottom_navigation_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        bottomNavigationBar: MyBottomNavigationBar(),
        body: SafeArea(child: Placeholder()));
  }
}
