// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:test_task/core/widgets/size_config.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(context);
    return CircleAvatar(
      radius: sizeConfig.screenWidth(22),
      child: Image.asset("assets/images/person.png"),
    );
  }
}
