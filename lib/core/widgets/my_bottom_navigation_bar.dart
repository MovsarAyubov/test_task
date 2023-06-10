// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_task/features/basket_page/presentation/pages/basket_page.dart';
import 'package:test_task/features/home_page/presentation/pages/home_page.dart';
import 'package:test_task/features/search_page/presentation/pages/search_page.dart';

import '../../features/profile_page/presentation/pages/profile_page.dart';
import '../../setup.dart';
import '../app_colors.dart';
import '../cubits/switch/switch_cubit.dart';
import '../cubits/switch/switch_state.dart';
import 'size_config.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  List<Widget> pages = [
    const HomePage(),
    const SearchPage(),
    const BasketPage(),
    const ProfilePage(),
  ];

  final switchCubit = getIt<SwitchCubit>();

  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(context);
    return BlocBuilder<SwitchCubit, SwitchState>(
        bloc: switchCubit,
        builder: (context, state) {
          return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: state.bottomNavigationBarIndex,
              onTap: (index) {
                switchCubit.switchPage(index);
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) =>
                          pages[switchCubit.state.bottomNavigationBarIndex],
                    ),
                    (route) => false);
              },
              unselectedLabelStyle: TextStyle(
                  color: greyText,
                  fontFamily: 'SF Pro Display',
                  fontSize: sizeConfig.screenWidth(10),
                  fontWeight: FontWeight.w500),
              showUnselectedLabels: true,
              selectedItemColor: blue,
              unselectedItemColor: greyText,
              selectedLabelStyle: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontSize: sizeConfig.screenWidth(10),
                  fontWeight: FontWeight.w500),
              items: [
                BottomNavigationBarItem(
                  label: "Главная",
                  icon: SvgPicture.asset(
                    "assets/images/home.svg",
                    width: sizeConfig.screenWidth(24),
                    height: sizeConfig.screenWidth(24),
                    color:
                        state.bottomNavigationBarIndex == 0 ? blue : greyText,
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Поиск",
                  icon: SvgPicture.asset(
                    "assets/images/search.svg",
                    color:
                        state.bottomNavigationBarIndex == 1 ? blue : greyText,
                    width: sizeConfig.screenWidth(24),
                    height: sizeConfig.screenWidth(24),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Корзина",
                  icon: SvgPicture.asset(
                    "assets/images/bag.svg",
                    color:
                        state.bottomNavigationBarIndex == 2 ? blue : greyText,
                    width: sizeConfig.screenWidth(24),
                    height: sizeConfig.screenWidth(24),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Аккаунт",
                  icon: SvgPicture.asset(
                    "assets/images/profile.svg",
                    color:
                        state.bottomNavigationBarIndex == 3 ? blue : greyText,
                    width: sizeConfig.screenWidth(24),
                    height: sizeConfig.screenWidth(24),
                  ),
                ),
              ]);
        });
  }
}
