import 'package:flutter/material.dart';
import 'package:smart_finance/sql/objects/Account.dart';
import 'package:smart_finance/sql/provider/account_provider.dart';
import 'package:smart_finance/ui/templates/account/account_template.dart';
import 'package:smart_finance/ui/templates/page_entry_template.dart';

import '../../../../../sql/database_helper.dart';
import '../../../../constants.dart';

class AccountsDisplay extends StatefulWidget {
  const AccountsDisplay({Key? key}) : super(key: key);

  @override
  State<AccountsDisplay> createState() => AccountsDisplayState();
}

class AccountsDisplayState extends State<AccountsDisplay> {
  late List<Account> accounts = <Account>[];
  late Map<String, List<Account>> sortedByType = <String,
      List<Account>>{};
  late List<Widget> widgetsToDisplay = <Widget>[];

  @override
  void initState() {
    super.initState();
    _loadValuesFromDatabase();
  }

  Future<void> _loadValuesFromDatabase() async {
    AccountProvider provider =
    await DatabaseHelper.getAccountProvider();

    List<Account> accounts = await provider.getAccounts();

    Map<String, List<Account>> sortedByType =
    <String, List<Account>>{};

    for (Account account in accounts) {
      List<Account>? list = sortedByType[account.type.toUpperCase()];

      list ??= <Account>[];
      list.add(account);

      sortedByType[account.type.toUpperCase()] = list;
    }

    List<Widget> widgetsToDisplay = <Widget>[];

    for (String str in sortedByType.keys) {
      List<Widget> widgets = <Widget>[];
      sortedByType[str]?.forEach((element) {
        widgets.add(
          AccountTemplate(account: element),
        );
      });

      double value = 0;
      sortedByType[str]?.forEach((element) {
        value += element.balance;
      });

      widgetsToDisplay.add(
        PageEntryWithBalance(
          title: str.toUpperCase(),
          balance: value,
          child: Wrap(
            runSpacing: kDefaultPadding * 1.5,
            children: widgets,
          ),
        ),
      );
    }

    setState(() {
      this.accounts = accounts;
      this.sortedByType = sortedByType;
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