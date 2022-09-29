import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_finance/ui/templates/page_entry_template.dart';

import '../../../../../sql/database_helper.dart';
import '../../../../../sql/objects/Transaction.dart';
import '../../../../../sql/provider/transaction_provider.dart';
import '../../../../constants.dart';
import '../../../../templates/edit_information_template.dart';


class InformationAdd extends StatefulWidget {
  InformationAdd({Key? key}) : super(key: key);

  late final EditInformationTemplate accountIDWidget = EditInformationTemplate(title: "AccountID", defaultValue: "");
  late final EditInformationTemplate statusWidget = EditInformationTemplate(title: "Status", defaultValue: "");
  late final EditInformationTemplate titleWidget = EditInformationTemplate(title: "Title", defaultValue: "");
  late final EditInformationTemplate messageWidget = EditInformationTemplate(title: "Message", defaultValue: "");
  late final EditInformationTemplate processDateWidget = EditInformationTemplate(title: "Date", defaultValue: DateFormat('dd.MM.yyyy, HH:mm').format(DateTime.now()));
  late final EditInformationTemplate amountWidget = EditInformationTemplate(title: "Amount", defaultValue: "0 €");
  late final EditInformationTemplate typeWidget = EditInformationTemplate(title: "Type", defaultValue: "");
  late final EditInformationTemplate merchantWidget = EditInformationTemplate(title: "Merchant", defaultValue: "");

  @override
  State<InformationAdd> createState() => _InformationAddState();

  Future<Transaction> saveData() async {
    TransactionProvider provider = await DatabaseHelper.getTransactionsProvider();
    Transaction temp = Transaction(
      null,
      int.parse(accountIDWidget.getController().value.text),
      titleWidget.getController().value.text,
      typeWidget.getController().value.text,
      merchantWidget.getController().text,
      statusWidget.getController().value.text,
      DateFormat('dd.MM.yyyy, HH:mm').parse(processDateWidget.textController.value.text),
      (messageWidget != "")
        ? messageWidget.getController().value.text
        : null,
      null,
      double.parse(amountWidget.getController().value.text.replaceAll("€", "").replaceAll(" ", "")),
      "assets/images/logo.png"
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
              widget.accountIDWidget,
              widget.statusWidget,
              widget.titleWidget,
              widget.messageWidget,
              widget.processDateWidget,
              widget.amountWidget,
              widget.typeWidget,
              widget.merchantWidget,
            ],
          ),
        ),
      ],
    );
  }
}