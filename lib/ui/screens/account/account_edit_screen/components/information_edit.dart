import 'package:flutter/material.dart';
import 'package:smart_finance/sql/provider/account_provider.dart';
import 'package:smart_finance/sql/provider/transaction_provider.dart';
import 'package:smart_finance/ui/templates/page_entry_template.dart';

import '../../../../../sql/database_helper.dart';
import '../../../../../sql/objects/Account.dart';
import '../../../../../sql/objects/Transaction.dart';
import '../../../../constants.dart';
import '../../../../templates/edit_information_template.dart';

class InformationEdit extends StatefulWidget {
  InformationEdit({Key? key, required this.account}) : super(key: key);

  final Account account;

  late final EditInformationTemplate titleWidget = EditInformationTemplate(title: "Title", defaultValue: account.title);
  late final EditInformationTemplate typeWidget = EditInformationTemplate(title: "Type", defaultValue: account.type);
  late final EditInformationTemplate accountNumberWidget = EditInformationTemplate(title: "Account Number", defaultValue: account.accountNumber);
  late final EditInformationTemplate balanceWidget = EditInformationTemplate(title: "Balance", defaultValue: "${account.balance} €");
  late final EditInformationTemplate limitWidget = EditInformationTemplate(title: "Limit", defaultValue: "${account.spendLimit} €");
  late final EditDateTimeInformationTemplate expirationDateWidget = EditDateTimeInformationTemplate(title: "Expiration date", defaultValue: account.expirationDate);
  late final EditDateTimeInformationTemplate lastUsedWidget = EditDateTimeInformationTemplate(title: "Last Used", defaultValue: account.lastUsed);

  @override
  State<InformationEdit> createState() => _InformationEditState();

  Future<Account> saveData() async {
    AccountProvider provider = await DatabaseHelper.getAccountProvider();
    Account temp = Account(
        account.id,
        titleWidget.textController.value.text,
        typeWidget.textController.value.text,
        accountNumberWidget.textController.value.text,
        double.parse(balanceWidget.textController.value.text.replaceAll(" €", "")),
        double.parse(limitWidget.textController.value.text.replaceAll(" €", "")),
        account.pathToIcon,
        expirationDateWidget.dateTime,
        lastUsedWidget.dateTime,
    );

    await provider.update(temp);

    return(temp);
  }
}

class _InformationEditState extends State<InformationEdit> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PageEntrySmallTitle(
          title: "INFORMATION",
          child: Wrap(
            runSpacing: kDefaultPadding * 1.5,
            children: [
              widget.titleWidget,
              widget.typeWidget,
              widget.accountNumberWidget,
              widget.balanceWidget,
              widget.limitWidget,
              widget.expirationDateWidget,
              widget.lastUsedWidget,
            ],
          ),
        ),
      ],
    );
  }
}