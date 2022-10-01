import 'package:flutter/material.dart';
import 'package:smart_finance/sql/objects/Account.dart';
import 'package:smart_finance/ui/screens/transaction/transactions_by_account_screen/components/transactions_display.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.account}) : super(key: key);

  final Account account;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: TransactionsDisplay(account: account),
    );
  }
}