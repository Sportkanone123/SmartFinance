import 'package:flutter/material.dart';
import 'package:smart_finance/sql/provider/transaction_provider.dart';
import 'package:smart_finance/ui/templates/page_entry_template.dart';

import '../../../../../sql/database_helper.dart';
import '../../../../../sql/objects/Transaction.dart';
import '../../../../constants.dart';
import '../../../../templates/edit_information_template.dart';

class InformationEdit extends StatefulWidget {
  InformationEdit({Key? key, required this.transaction}) : super(key: key);

  final Transaction transaction;

  late final EditInformationTemplate statusWidget = EditInformationTemplate(title: "Status", defaultValue: transaction.status.toUpperCase());
  late final EditInformationTemplate titleWidget = EditInformationTemplate(title: "Title", defaultValue: transaction.title);
  late final EditInformationTemplate messageWidget = EditInformationTemplate(title: "Message", defaultValue: transaction.message!);
  late final EditDateTimeInformationTemplate dateWidget = EditDateTimeInformationTemplate(title: "Date", defaultValue: transaction.processDateTime);
  late final EditInformationTemplate amountWidget = EditInformationTemplate(title: "Amount", defaultValue: "${transaction.amount} €");
  late final EditInformationTemplate typeWidget = EditInformationTemplate(title: "Type", defaultValue: transaction.type.toUpperCase());
  late final EditInformationTemplate merchantWidget = EditInformationTemplate(title: "Merchant", defaultValue: transaction.merchant);

  @override
  State<InformationEdit> createState() => _InformationEditState();

  Future<Transaction> saveData() async {
    TransactionProvider provider = await DatabaseHelper.getTransactionsProvider();
    Transaction temp = Transaction(
        transaction.id,
        transaction.accountId,
        titleWidget.textController.value.text,
        typeWidget.textController.value.text,
        merchantWidget.textController.value.text,
        statusWidget.textController.value.text,
        dateWidget.dateTime,
        messageWidget.textController.value.text,
        transaction.spendingGoalId,
        double.parse(amountWidget.textController.value.text.replaceAll(" €", "")),
        transaction.pathToIcon
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
              widget.statusWidget,
              widget.titleWidget,

              if (widget.transaction.message != null)
                widget.messageWidget,

              widget.dateWidget,
              widget.amountWidget,
              widget.typeWidget,

              if(widget.transaction.type == "receipt")
                widget.merchantWidget,
            ],
          ),
        ),
      ],
    );
  }
}