// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:test_task/features/home_page/domain/usecases/get_categories.dart';

import 'categories_state.dart';

@Injectable()
class HomePageCubit extends Cubit<HomePageState> {
  final GetCategories usecase;
  HomePageCubit(
    this.usecase,
  ) : super(LoadingState());

  void getData() async {
    final response = await usecase();
    response.fold((error) => emit(ErrorState()),
        (result) => emit(LoadedState(categories: result)));
  }
}
