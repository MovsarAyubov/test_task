import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/error_widget.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../../../core/widgets/my_bottom_navigation_bar.dart';
import '../../../../setup.dart';
import '../cubit/dishes_cubit.dart';
import '../cubit/dishes_state.dart';
import '../widgets/dishes_page_content.dart';

class DishesPage extends StatefulWidget {
  const DishesPage({super.key});

  @override
  State<DishesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<DishesPage>
    with AutomaticKeepAliveClientMixin<DishesPage> {
  final dishesCubit = getIt<DishesCubit>();

  @override
  void initState() {
    dishesCubit.getDishes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      bottomNavigationBar: const MyBottomNavigationBar(),
      body: SafeArea(
          child: BlocBuilder<DishesCubit, DishesState>(
              bloc: dishesCubit,
              builder: (context, state) {
                if (state is DishesErrorState) {
                  return const MyErrorWidget();
                } else if (state is DishesLoadedState) {
                  return DishesPageContent(state: state);
                } else {
                  return const LoadingIndicator();
                }
              })),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
