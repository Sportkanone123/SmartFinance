import 'package:flutter/material.dart';
import 'package:smart_finance/sql/objects/Transaction.dart';

import '../../../components/my_bottom_nav_bar.dart';
import '../../../constants.dart';
import 'components/body.dart';
import 'components/header.dart';

class TransactionDisplayScreen extends StatelessWidget {
  const TransactionDisplayScreen({Key? key, required this.transaction}) : super(key: key);

  final Transaction transaction;

  @override
  Widget build(context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(transaction: transaction,),
      bottomNavigationBar: const MyBottomNavBar(selected: 1,),
      backgroundColor: kBackgroundColor,
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 55,
      elevation: 0,
      flexibleSpace: Column(
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.width * 0.1,),
          Header(amount: transaction.amount, transaction: transaction,),
        ],
      ),
      backgroundColor: const Color(0xFFFAFAFA),
      automaticallyImplyLeading: false,
    );
  }
}