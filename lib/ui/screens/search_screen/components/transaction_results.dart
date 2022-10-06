import 'package:flutter/material.dart';
import 'package:smart_finance/sql/provider/account_provider.dart';
import 'package:smart_finance/ui/templates/account/account_template.dart';

import '../../../../sql/database_helper.dart';
import '../../../../sql/objects/Account.dart';
import '../../../../sql/objects/Transaction.dart';
import '../../../../sql/provider/transaction_provider.dart';
import '../../../constants.dart';
import '../../../templates/page_entry_template.dart';
import '../../../templates/transaction/transaction_template.dart';
import '../../transaction/transactions_screen/transactions_screen.dart';

class TransactionResults extends StatefulWidget {
  const TransactionResults({Key? key, required this.keyword}) : super(key: key);
  final String keyword;

  @override
  State<TransactionResults> createState() => _TransactionResultsState();
}

class _TransactionResultsState extends State<TransactionResults> {
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

    List<Transaction> transactions = await provider.getTransactionsByKeyword(widget.keyword);

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
    return PageEntryBoldTitle(
      title: "Transactions",
      child: Wrap(
        runSpacing: kDefaultPadding * 1.5,
        children: (widgetsToDisplay.isEmpty)
            ? [const SizedBox( width: double.maxFinite, child: Text("No transactions match the input."))]
            : widgetsToDisplay,
      ),
    );
  }
}

