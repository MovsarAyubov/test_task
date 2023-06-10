// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:test_task/features/dishes_page/domain/entities/dish_entity.dart';
import 'package:test_task/features/dishes_page/domain/usecases/get_dishes.dart';

import 'dishes_state.dart';

@Injectable()
class DishesCubit extends Cubit<DishesState> {
  final GetDishes usecase;
  DishesCubit(this.usecase) : super(DishesLoadingState());

  Future<void> getDishes() async {
    final response = await usecase();
    response.fold((error) => emit(DishesErrorState()), (dishes) {
      emit(DishesLoadedState(dishes: dishes.dishes));
    });
  }

  List<DishEntity> sortDishesByTag(
      {required String teg, required List<DishEntity> dishes}) {
    final sortedDishes = List<DishEntity>.from(dishes);
    return sortedDishes..removeWhere((element) => !element.tegs.contains(teg));
  }
}
