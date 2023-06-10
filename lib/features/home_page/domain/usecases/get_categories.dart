// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_task/features/home_page/domain/entities/category_entity.dart';
import 'package:test_task/features/home_page/domain/repositories/home_page_respository.dart';

import '../../../../core/errors/failure.dart';

@LazySingleton()
class GetCategories {
  final HomePageRepository repository;
  GetCategories({required this.repository});

  Future<Either<Failure, List<CategoryEntity>>> call() async {
    return await repository.getData();
  }
}
