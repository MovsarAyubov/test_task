import '../models/dishes_response.dart';

abstract class DishesDataSource {
  Future<DishesResponse> getDishes();
}
