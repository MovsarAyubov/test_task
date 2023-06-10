import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/dish_entity.dart';

abstract class DishesPageRepository {
  Future<Either<Failure, List<DishEntity>>> getData();
}
