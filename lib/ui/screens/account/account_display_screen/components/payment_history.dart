import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_finance/sql/objects/Account.dart';
import 'package:smart_finance/ui/screens/transaction/transactions_by_account_screen/transactions_by_account_screen.dart';
import 'package:smart_finance/ui/templates/page_entry_template.dart';
import 'package:smart_finance/utils/date_helpers.dart';

import '../../../../../sql/database_helper.dart';
import '../../../../../sql/objects/Transaction.dart';
import '../../../../../sql/provider/transaction_provider.dart';
import '../../../../constants.dart';
import '../../../../templates/transaction/transaction_template.dart';

class PaymentHistory extends StatefulWidget {
  const PaymentHistory({Key? key, required this.account}) : super(key: key);

  final Account account;

  @override
  State<PaymentHistory> createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  late List<Transaction> transactions = <Transaction>[];
  late Map<DateTime, List<Transaction>> sortedByDate = <DateTime,
      List<Transaction>>{};
  late List<Widget> widgetsToDisplay = <Widget>[];

  @override
  void initState() {
    super.initState();
    _loadValuesFromDatabase();
  }

  Future<void> _loadValuesFromDatabase() async {
    TransactionProvider provider = await DatabaseHelper.getTransactionsProvider();
    List<Transaction> transactions = await provider.getTransactionsByAccountID(widget.account.id!, 5);

    List<Widget> widgetsToDisplay = <Widget>[];

    for (var element in transactions) {
      widgetsToDisplay.add(TransactionTemplate(transaction: element));
    }

    setState(() {
      this.transactions = transactions;
      this.widgetsToDisplay = widgetsToDisplay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageEntrySmallTitleExtendOption(
      title: "HISTORY",
      extendWidget: TransactionsByAccountScreen(account: widget.account,),
      child: Wrap(
        runSpacing: kDefaultPadding * 1.5,
        children: widgetsToDisplay,
      ),
    );
  }
}