import 'package:flutter/material.dart';

import '../../../core/widgets/text_widget.dart';

class MyErrorWidget extends StatelessWidget {
  const MyErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SFProText(
        "Ошибка",
        fontSize: 18,
      ),
    );
  }
}
