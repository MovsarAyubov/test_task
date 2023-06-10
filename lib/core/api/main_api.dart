// ignore_for_file: file_names

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:test_task/core/api/urls.dart';

import 'client.dart';

@Injectable()
class MainApi {
  const MainApi();

  RestClient client() {
    final dio = Dio(
      BaseOptions(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );

    return RestClient(dio, baseUrl: Urls.baseUrl);
  }
}
