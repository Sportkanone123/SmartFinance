import 'package:flutter/material.dart';

import '../../../../../sql/objects/Account.dart';
import 'information_add.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.widget}) : super(key: key);

  final InformationAdd widget;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          widget,
        ],
      ),
    );
  }
}