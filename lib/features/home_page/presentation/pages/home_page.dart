import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/error_widget.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../../../core/widgets/size_config.dart';
import '../../../../setup.dart';
import '../cubit/categories_cubit.dart';
import '../cubit/categories_state.dart';
import '../widgets/home.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  final homePageCubit = getIt<HomePageCubit>();

  @override
  void initState() {
    homePageCubit.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final sizeConfig = SizeConfig(context);
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.symmetric(
          horizontal: sizeConfig.screenWidth(16),
        ),
        child: BlocBuilder<HomePageCubit, HomePageState>(
          bloc: homePageCubit,
          builder: (context, state) {
            if (state is LoadedState) {
              return Home(state: state);
            } else if (state is ErrorState) {
              return const MyErrorWidget();
            } else {
              return const LoadingIndicator();
            }
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
