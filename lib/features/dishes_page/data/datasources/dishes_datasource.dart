import '../models/dish_model.dart';

abstract class DishesDataSource {
  Future<List<DishModel>> getDishes();
}
