import 'package:flutter/material.dart';
import 'package:smart_finance/sql/objects/Account.dart';
import 'package:smart_finance/sql/provider/account_provider.dart';
import 'package:smart_finance/ui/screens/account/my_accounts_screen/my_accounts_screen.dart';
import 'package:smart_finance/ui/templates/account/account_template.dart';
import 'package:smart_finance/ui/templates/page_entry_template.dart';

import '../../../../sql/database_helper.dart';
import '../../../constants.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
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

    List<Account> accounts = await provider.getAccounts();

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
    return PageEntryExtendOption(
      title: "My accounts",
      extendWidget: const MyAccountsScreen(),
      child: Wrap(
        runSpacing: kDefaultPadding * 1.5,
        children: widgetsToDisplay,
      ),
    );
  }
}