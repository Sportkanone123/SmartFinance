import 'package:flutter/material.dart';
import 'package:smart_finance/ui/screens/search_screen/components/account_results.dart';
import 'package:smart_finance/ui/screens/search_screen/components/transaction_results.dart';

import 'header.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.keyword}) : super(key: key);
  final String keyword;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          AccountResults(keyword: keyword),
          TransactionResults(keyword: keyword),
        ],
      ),
    );
  }
}