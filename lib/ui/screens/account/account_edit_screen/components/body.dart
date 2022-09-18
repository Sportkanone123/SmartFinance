import 'package:flutter/material.dart';
import 'package:smart_finance/sql/objects/Transaction.dart';

import '../../../../../sql/objects/Account.dart';
import 'information_edit.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.account, required this.widget}) : super(key: key);

  final Account account;
  final InformationEdit widget;

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