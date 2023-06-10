import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_task/core/widgets/size_config.dart';
import 'package:test_task/router/app_router.dart';

import '../../../../core/app_colors.dart';

@RoutePage()
class ScreenManagerPage extends StatefulWidget {
  const ScreenManagerPage({super.key});

  @override
  State<ScreenManagerPage> createState() => _ScreenManagerState();
}

class _ScreenManagerState extends State<ScreenManagerPage> {
  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(context);
    return AutoTabsScaffold(
        routes: const [
          HomeRoute(),
          SearchRoute(),
          BasketRoute(),
          ProfileRoute(),
        ],
        bottomNavigationBuilder: (context, tabsRouter) {
          final activeIndex = tabsRouter.activeIndex;
          return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: tabsRouter.activeIndex,
              onTap: (index) {
                tabsRouter.setActiveIndex(index);
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
                    colorFilter: ColorFilter.mode(
                        activeIndex == 0 ? blue : greyText, BlendMode.srcIn),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Поиск",
                  icon: SvgPicture.asset(
                    "assets/images/search.svg",
                    colorFilter: ColorFilter.mode(
                        activeIndex == 1 ? blue : greyText, BlendMode.srcIn),
                    width: sizeConfig.screenWidth(24),
                    height: sizeConfig.screenWidth(24),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Корзина",
                  icon: SvgPicture.asset(
                    "assets/images/bag.svg",
                    colorFilter: ColorFilter.mode(
                        activeIndex == 2 ? blue : greyText, BlendMode.srcIn),
                    width: sizeConfig.screenWidth(24),
                    height: sizeConfig.screenWidth(24),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Аккаунт",
                  icon: SvgPicture.asset(
                    "assets/images/profile.svg",
                    colorFilter: ColorFilter.mode(
                        activeIndex == 3 ? blue : greyText, BlendMode.srcIn),
                    width: sizeConfig.screenWidth(24),
                    height: sizeConfig.screenWidth(24),
                  ),
                ),
              ]);
        });
  }
}
