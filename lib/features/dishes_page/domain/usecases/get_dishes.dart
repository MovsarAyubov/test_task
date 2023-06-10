// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_task/features/dishes_page/data/models/dishes_response.dart';
import 'package:test_task/features/dishes_page/domain/repositories/dishes_page_repository.dart';

import '../../../../core/errors/failure.dart';

@LazySingleton()
class GetDishes {
  final DishesPageRepository repository;
  GetDishes({required this.repository});

  Future<Either<Failure, DishesResponse>> call() async {
    return await repository.getData();
  }
}
