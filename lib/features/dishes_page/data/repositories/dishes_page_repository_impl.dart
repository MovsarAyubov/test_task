// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_task/core/errors/failure.dart';
import 'package:test_task/features/dishes_page/data/datasources/dishes_datasource.dart';
import 'package:test_task/features/dishes_page/domain/entities/dish_entity.dart';
import 'package:test_task/features/dishes_page/domain/repositories/dishes_page_repository.dart';

@LazySingleton(as: DishesPageRepository)
class DishesPageRepositoryImpl implements DishesPageRepository {
  final DishesDataSource source;
  DishesPageRepositoryImpl({
    required this.source,
  });
  @override
  Future<Either<Failure, List<DishEntity>>> getData() async {
    try {
      final dishes = await source.getDishes();
      return Right(dishes);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
