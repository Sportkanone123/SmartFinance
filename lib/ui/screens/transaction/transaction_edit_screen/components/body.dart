import 'package:flutter/material.dart';
import 'package:smart_finance/sql/objects/Transaction.dart';

import 'information_edit.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.transaction, required this.widget}) : super(key: key);

  final Transaction transaction;
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