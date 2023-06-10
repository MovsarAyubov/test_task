import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../features/dishes_page/data/models/dish_model.dart';
import '../../features/home_page/data/models/category_model.dart';
import 'urls.dart';

part 'client.g.dart';

@RestApi(baseUrl: Urls.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET(Urls.categories)
  Future<List<CategoryModel>> getCategories();

  @GET(Urls.dishes)
  Future<List<DishModel>> getDishes();
}
