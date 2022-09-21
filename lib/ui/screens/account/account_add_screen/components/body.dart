import 'package:flutter/material.dart';
import 'package:smart_finance/ui/screens/account/account_add_screen/components/information_add.dart';

import '../../../../../sql/objects/Account.dart';

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