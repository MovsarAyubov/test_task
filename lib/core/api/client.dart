import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../../features/dishes_page/data/models/dishes_response.dart';
import '../../features/home_page/data/models/categories_response.dart';

import 'urls.dart';

part 'client.g.dart';

@RestApi(baseUrl: Urls.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET(Urls.categories)
  Future<CategoriesResponse> getCategories();

  @GET(Urls.dishes)
  Future<DishesResponse> getDishes();
}
