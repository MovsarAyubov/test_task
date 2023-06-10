// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:test_task/features/dishes_page/domain/entities/dish_entity.dart';

class DishesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DishesLoadedState extends DishesState {
  final List<DishEntity> dishes;
  DishesLoadedState({
    this.dishes = const [],
  });

  @override
  List<Object?> get props => [dishes];
}

class DishesErrorState extends DishesState {}

class DishesLoadingState extends DishesState {}
