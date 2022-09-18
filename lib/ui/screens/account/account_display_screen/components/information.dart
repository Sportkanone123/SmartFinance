import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_finance/sql/objects/Account.dart';
import 'package:smart_finance/ui/templates/information_template.dart';
import 'package:smart_finance/ui/templates/page_entry_template.dart';

import '../../../../../sql/objects/Transaction.dart';
import '../../../../constants.dart';

class Information extends StatelessWidget {
  const Information({Key? key, required this.account}) : super(key: key);

  final Account account;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PageEntrySmallTitle(
          title: "INFORMATION",
          child: Wrap(
            runSpacing: kDefaultPadding * 1.5,
            children: [
              InformationTemplate(title: "Title", value: account.title),
              InformationTemplate(title: "Type", value: account.type.toUpperCase()),
              InformationTemplate(title: "Account Number", value: account.accountNumber),

              InformationTemplate(title: "Balance", value: "${account.balance} €"),
              InformationTemplate(title: "Limit", value: "${account.spendLimit} € "),

              InformationTemplate(title: "Expiration Date", value: DateFormat('dd MMMM yyyy, HH:mm').format(account.expirationDate)),
              InformationTemplate(title: "Last Used", value: DateFormat('dd MMMM yyyy, HH:mm').format(account.lastUsed)),
            ],
          ),
        ),
      ],
    );
  }
}