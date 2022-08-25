import 'package:flutter/material.dart';
import 'package:smart_finance/sql/objects/Account.dart';
import 'package:smart_finance/ui/templates/account/account_template.dart';
import 'package:smart_finance/ui/templates/page_entry_template.dart';

import '../../../../../sql/objects/Transaction.dart';
import '../../../../constants.dart';
import '../../../../templates/transaction/transaction_template.dart';

class TransactionsDisplay extends StatelessWidget {
  const TransactionsDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PageEntryWithBalance(
          title: "TODAY",
          balance: 7654.00,
          child: Wrap(
            runSpacing: kDefaultPadding * 1.5,
            children: [
              TransactionTemplate(transaction: Transaction(1, "Salary payment", "receipt", "PayGoal GmbH", "completed", DateTime.now(), "Salary for January 2022", null, 7654.00, "assets/images/logo.png")),
            ],
          ),
        ),
        PageEntryWithBalance(
          title: "19 AUG 2022",
          balance: -89.99,
          child: Wrap(
            runSpacing: kDefaultPadding * 1.5,
            children: [
              TransactionTemplate(transaction: Transaction(2, "Dropbox Organization", "payment", "Myself", "pending", DateTime.now(), "Payment for yearly fee - 2022", null, -89.99, "assets/images/logo.png")),
            ],
          ),
        ),
      ],
    );
  }
}