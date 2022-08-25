import 'package:flutter/material.dart';
import 'package:smart_finance/sql/objects/Account.dart';
import 'package:smart_finance/ui/screens/account/my_accounts_screen/my_accounts_screen.dart';
import 'package:smart_finance/ui/templates/account/account_template.dart';
import 'package:smart_finance/ui/templates/page_entry_template.dart';

import '../../../constants.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({Key? key, required this.size}) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return PageEntryExtendOption(
        title: "My accounts",
        extendWidget: const MyAccountsScreen(),
        child: Wrap(
          runSpacing: kDefaultPadding * 1.5,
          children: [
            AccountTemplate(account: Account(1, "Private Account", "credit_card", "0123456789", 19234, 1000, "assets/images/logo.png", DateTime.now(), DateTime.now()),),
            AccountTemplate(account: Account(2, "Work Account", "master_card", "8488796732", 30012, 25000, "assets/images/logo.png", DateTime.now(), DateTime.now()),),
          ],
        ),
    );
  }
}