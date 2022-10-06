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

class AccountResults extends StatefulWidget {
  const AccountResults({Key? key, required this.keyword}) : super(key: key);
  final String keyword;

  @override
  State<AccountResults> createState() => _AccountResultsState();
}

class _AccountResultsState extends State<AccountResults> {
  late List<Account> accounts = <Account>[];
  late List<Widget> widgetsToDisplay = <Widget>[];

  @override
  void initState() {
    super.initState();
    _loadValuesFromDatabase();
  }

  Future<void> _loadValuesFromDatabase() async {
    AccountProvider provider =
    await DatabaseHelper.getAccountProvider();

    List<Account> accounts = await provider.getAccountsByKeyword(widget.keyword);

    List<Widget> widgetsToDisplay = <Widget>[];

    for (Account account in accounts) {
      widgetsToDisplay.add(AccountTemplate(account: account,));
    }

    setState(() {
      this.accounts = accounts;
      this.widgetsToDisplay = widgetsToDisplay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageEntryBoldTitle(
      title: "Accounts",
      child: Wrap(
        runSpacing: kDefaultPadding * 1.5,
          children: (widgetsToDisplay.isEmpty)
          ? [const SizedBox( width: double.maxFinite, child: Text("No accounts match the input."))]
          : widgetsToDisplay,
      ),
    );
  }
}

