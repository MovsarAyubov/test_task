import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/repositories/home_page_respository.dart';
import '../datasources/home_page_datasource.dart';

@LazySingleton(as: HomePageRepository)
class HomePageRepositoryImpl implements HomePageRepository {
  final DataSource source;
  const HomePageRepositoryImpl(
    this.source,
  );

  @override
  Future<Either<Failure, List<CategoryEntity>>> getData() async {
    try {
      final categories = await source.getCategories();
      return Right(categories);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
