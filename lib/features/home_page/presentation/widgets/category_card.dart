// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:test_task/core/widgets/size_config.dart';
import 'package:test_task/core/widgets/text_widget.dart';
import 'package:test_task/router/app_router.dart';

import '../../../../setup.dart';
import '../../domain/entities/category_entity.dart';

class CategoryCard extends StatelessWidget {
  final CategoryEntity categoryItem;
  final Color boxColor;
  const CategoryCard({
    Key? key,
    required this.categoryItem,
    required this.boxColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(context);
    return GestureDetector(
      onTap: () {
        getIt<AppRouter>().push(const DishesRoute());
      },
      child: Container(
        height: sizeConfig.screenHeight(148),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: boxColor),
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            Image.network(categoryItem.imageUrl),
            Positioned(
                top: sizeConfig.screenHeight(12),
                left: sizeConfig.screenWidth(16),
                child: SFProText(
                  categoryItem.name,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                )),
          ],
        ),
      ),
    );
  }
}
