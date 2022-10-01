import 'package:flutter/material.dart';
import 'package:smart_finance/sql/objects/Account.dart';
import 'package:smart_finance/sql/objects/Transaction.dart';
import 'package:smart_finance/ui/screens/account/account_display_screen/components/payment_history.dart';

import 'information.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.account}) : super(key: key);

  final Account account;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Information(account: account,),
          PaymentHistory(account: account)
        ],
      ),
    );
  }
}