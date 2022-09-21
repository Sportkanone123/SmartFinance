import 'package:flutter/material.dart';
import 'package:smart_finance/sql/provider/account_provider.dart';
import 'package:smart_finance/ui/templates/page_entry_template.dart';

import '../../../../../sql/database_helper.dart';
import '../../../../../sql/objects/Account.dart';
import '../../../../constants.dart';
import '../../../../templates/edit_information_template.dart';


class InformationAdd extends StatefulWidget {
  InformationAdd({Key? key}) : super(key: key);

  late final EditInformationTemplate titleWidget = EditInformationTemplate(title: "Title", defaultValue: "");
  late final EditInformationTemplate typeWidget = EditInformationTemplate(title: "Type", defaultValue: "");
  late final EditInformationTemplate accountNumberWidget = EditInformationTemplate(title: "Account Number", defaultValue: "");
  late final EditInformationTemplate balanceWidget = EditInformationTemplate(title: "Balance", defaultValue: "0 €");
  late final EditInformationTemplate limitWidget = EditInformationTemplate(title: "Limit", defaultValue: "0 €");
  late final EditDateTimeInformationTemplate expirationDateWidget = EditDateTimeInformationTemplate(title: "Expiration date", defaultValue: DateTime.now());
  late final EditDateTimeInformationTemplate lastUsedWidget = EditDateTimeInformationTemplate(title: "Last Used", defaultValue: DateTime.now());

  @override
  State<InformationAdd> createState() => _InformationAddState();

  Future<Account> saveData() async {
    AccountProvider provider = await DatabaseHelper.getAccountProvider();
    Account temp = Account(
      null,
      titleWidget.textController.value.text,
      typeWidget.textController.value.text,
      accountNumberWidget.textController.value.text,
      double.parse(balanceWidget.textController.value.text.replaceAll(" €", "")),
      double.parse(limitWidget.textController.value.text.replaceAll(" €", "")),
      "assets/images/logo.png",
      expirationDateWidget.dateTime,
      lastUsedWidget.dateTime,
    );

    await provider.insert(temp);

    return(temp);
  }
}

class _InformationAddState extends State<InformationAdd> {

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