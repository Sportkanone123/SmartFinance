import 'package:flutter/material.dart';
import 'package:smart_finance/sql/objects/Transaction.dart';

import 'header.dart';
import 'information.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.transaction}) : super(key: key);

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Information(transaction: transaction,),

        ],
      ),
    );
  }
}