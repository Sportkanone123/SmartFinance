import 'package:flutter/material.dart';

import '../../../../sql/database_helper.dart';
import '../../../../sql/objects/Transaction.dart';
import '../../../../sql/provider/transaction_provider.dart';
import '../../../constants.dart';
import '../../../templates/page_entry_template.dart';
import '../../../templates/transaction/transaction_template.dart';
import '../../transaction/transactions_screen/transactions_screen.dart';

class Transactions extends StatefulWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  late List<Transaction> transactions = <Transaction>[];
  late List<Widget> widgetsToDisplay = <Widget>[];

  @override
  void initState() {
    super.initState();
    _loadValuesFromDatabase();
  }

  Future<void> _loadValuesFromDatabase() async {
    TransactionProvider provider =
    await DatabaseHelper.getTransactionsProvider();

    List<Transaction> transactions = await provider.getTransactions();

    List<Widget> widgetsToDisplay = <Widget>[];

    for (Transaction transaction in transactions) {
      widgetsToDisplay.add(TransactionTemplate(transaction: transaction,));
    }

    setState(() {
      this.transactions = transactions;
      this.widgetsToDisplay = widgetsToDisplay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageEntryExtendOption(
      title: "Transactions",
      extendWidget: const TransactionsScreen(),
      child: Wrap(
        runSpacing: kDefaultPadding * 1.5,
        children: widgetsToDisplay,
      ),
    );
  }
}

