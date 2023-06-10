// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:test_task/features/home_page/domain/entities/category_entity.dart';

class HomePageState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadedState extends HomePageState {
  final List<CategoryEntity> categories;
  LoadedState({
    this.categories = const [],
  });
  @override
  List<Object?> get props => [categories];
}

class ErrorState extends HomePageState {}

class LoadingState extends HomePageState {}
