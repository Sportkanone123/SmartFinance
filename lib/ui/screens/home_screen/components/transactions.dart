import 'package:flutter/material.dart';
import 'package:smart_finance/sql/objects/Transaction.dart';

import '../../../constants.dart';
import '../../../templates/page_entry_template.dart';
import '../../../templates/transaction/transaction_template.dart';
import '../../transaction/transactions_screen/transactions_screen.dart';

class Transactions extends StatelessWidget {
  const Transactions({Key? key, required this.size}) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return PageEntryExtendOption(
      title: "Transactions",
      extendWidget: const TransactionsScreen(),
      child: Wrap(
        runSpacing: kDefaultPadding * 1.5,
        children: [
          TransactionTemplate(transaction: Transaction(1, 1, "Salary payment", "receipt", "PayGoal GmbH", "completed", DateTime.now(), "Salary for January 2022", null, 7654.00, "assets/images/logo.png")),
          TransactionTemplate(transaction: Transaction(2, 2, "Dropbox Organization", "payment", "Myself", "pending", DateTime.now(), null, null, -89.99, "assets/images/logo.png")),
        ],
      ),
    );
  }
}