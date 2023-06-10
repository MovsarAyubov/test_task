import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/dishes_response.dart';

abstract class DishesPageRepository {
  Future<Either<Failure, DishesResponse>> getData();
}
