import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  late final EditInformationTemplate expirationDateWidget = EditInformationTemplate(title: "Expiration date", defaultValue: DateFormat('dd.MM.yyyy, HH:mm').format(DateTime.now()));
  late final EditInformationTemplate lastUsedWidget = EditInformationTemplate(title: "Last Used", defaultValue: DateFormat('dd.MM.yyyy, HH:mm').format(DateTime.now()));

  @override
  State<InformationAdd> createState() => _InformationAddState();

  Future<Account> saveData() async {
    AccountProvider provider = await DatabaseHelper.getAccountProvider();
    Account temp = Account(
      null,
      titleWidget.getController().value.text,
      typeWidget.getController().value.text,
      accountNumberWidget.getController().value.text,
      double.parse(balanceWidget.getController().value.text.replaceAll(" €", "")),
      double.parse(limitWidget.getController().value.text.replaceAll(" €", "")),
      "assets/images/logo.png",
      DateFormat('dd.MM.yyyy, HH:mm').parse(expirationDateWidget.textController.value.text),
      DateFormat('dd.MM.yyyy, HH:mm').parse(lastUsedWidget.textController.value.text),
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