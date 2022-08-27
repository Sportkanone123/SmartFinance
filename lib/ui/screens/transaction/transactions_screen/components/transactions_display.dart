import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_finance/sql/provider/transaction_provider.dart';
import 'package:smart_finance/ui/templates/page_entry_template.dart';
import 'package:smart_finance/utils/date_helpers.dart';

import '../../../../../sql/database_helper.dart';
import '../../../../../sql/objects/Transaction.dart';
import '../../../../constants.dart';
import '../../../../templates/transaction/transaction_template.dart';

class TransactionsDisplay extends StatefulWidget {
  const TransactionsDisplay({Key? key}) : super(key: key);

  @override
  State<TransactionsDisplay> createState() => TransactionsDisplayState();
}

class TransactionsDisplayState extends State<TransactionsDisplay> {
  late List<Transaction> transactions = <Transaction>[];
  late Map<DateTime, List<Transaction>> sortedByDate = <DateTime, List<Transaction>>{};
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

    Map<DateTime, List<Transaction>> sortedByDate =
        <DateTime, List<Transaction>>{};

    for (Transaction transaction in transactions) {
      DateTime onlyDate = DateTime(
        transaction.processDateTime.year,
        transaction.processDateTime.month,
        transaction.processDateTime.day,
      );

      List<Transaction>? list = sortedByDate[onlyDate];

      list ??= <Transaction>[];
      list.add(transaction);

      sortedByDate[onlyDate] = list;
    }

    List<Widget> widgetsToDisplay = <Widget>[];

    for (DateTime date in sortedByDate.keys) {
      List<Widget> widgets = <Widget>[];
      sortedByDate[date]?.forEach((element) {
        widgets.add(
          TransactionTemplate(transaction: element),
        );
      });

      double value = 0;
      sortedByDate[date]?.forEach((element) {
        value += element.amount;
      });

      if (date.isToday()) {
        widgetsToDisplay.add(
          PageEntryWithBalance(
            title: "TODAY",
            balance: value,
            child: Wrap(
              runSpacing: kDefaultPadding * 1.5,
              children: widgets,
            ),
          ),
        );
      } else {
        widgetsToDisplay.add(
          PageEntryWithBalance(
            title: DateFormat('dd MMMM yyyy').format(date),
            balance: value,
            child: Wrap(
              runSpacing: kDefaultPadding * 1.5,
              children: widgets,
            ),
          ),
        );
      }
    }

    setState(() {
      this.transactions = transactions;
      this.sortedByDate = sortedByDate;
      this.widgetsToDisplay = widgetsToDisplay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widgetsToDisplay,
    );
  }
}
