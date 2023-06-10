// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:test_task/features/dishes_page/presentation/widgets/square_button.dart';

import '../../../../core/widgets/size_config.dart';

class DishImage extends StatelessWidget {
  final SizeConfig sizeConfig;
  final String imageUrl;
  const DishImage({
    Key? key,
    required this.sizeConfig,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 20,
          bottom: 0,
          right: 0,
          left: 18,
          child: Image.network(imageUrl),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: Row(
            children: [
              SquareButton(
                icon: Icons.favorite_border_outlined,
                onTap: () {},
              ),
              SizedBox(width: sizeConfig.screenWidth(8)),
              SquareButton(
                icon: Icons.close_rounded,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
