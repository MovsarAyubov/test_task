// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/error_widget.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../../../setup.dart';
import '../cubit/dishes_cubit.dart';
import '../cubit/dishes_state.dart';
import '../widgets/dishes_page_content.dart';

@RoutePage()
class DishesPage extends StatefulWidget {
  final String categoryName;
  const DishesPage({
    Key? key,
    required this.categoryName,
  }) : super(key: key);

  @override
  State<DishesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<DishesPage>
    with AutomaticKeepAliveClientMixin {
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
      body: SafeArea(
          child: BlocBuilder<DishesCubit, DishesState>(
              bloc: dishesCubit,
              builder: (context, state) {
                if (state is DishesErrorState) {
                  return const MyErrorWidget();
                } else if (state is DishesLoadedState) {
                  return DishesPageContent(
                      state: state, categoryName: widget.categoryName);
                } else {
                  return const LoadingIndicator();
                }
              })),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
