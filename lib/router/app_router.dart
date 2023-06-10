import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

import '../features/basket_page/presentation/pages/basket_page.dart';
import '../features/dishes_page/presentation/pages/dishes_page.dart';
import '../features/home_page/presentation/pages/home_page.dart';
import '../features/profile_page/presentation/pages/profile_page.dart';
import '../features/screen_manager/presentation/pages/screen_manager.dart';
import '../features/search_page/presentation/pages/search_page.dart';

part 'app_router.gr.dart';

@singleton
@AutoRouterConfig(replaceInRouteName: "Page,Route")
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: ScreenManagerRoute.page, path: "/", children: [
      AutoRoute(
        page: EmptyRoute.page,
        children: [
          AutoRoute(page: HomeRoute.page, initial: true),
          AutoRoute(page: DishesRoute.page),
        ],
      ),
      AutoRoute(page: SearchRoute.page),
      AutoRoute(page: BasketRoute.page),
      AutoRoute(page: ProfileRoute.page),
    ]),
  ];
}

@RoutePage()
class EmptyPage extends AutoRouter {
  const EmptyPage({super.key});
}
