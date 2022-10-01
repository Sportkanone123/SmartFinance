import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_finance/sql/provider/transaction_provider.dart';
import 'package:smart_finance/ui/templates/page_entry_template.dart';

import '../../../../../sql/database_helper.dart';
import '../../../../../sql/objects/Transaction.dart';
import '../../../../components/no_animation_material_page_router.dart';
import '../../../../constants.dart';
import '../../../../templates/edit_information_template.dart';
import '../../transaction_display_screen/transaction_display_screen.dart';

class InformationEdit extends StatefulWidget {
  InformationEdit({Key? key, required this.transaction}) : super(key: key);

  final Transaction transaction;

  late final EditInformationTemplate statusWidget = EditInformationTemplate(title: "Status", defaultValue: transaction.status.toLowerCase());
  late final EditInformationTemplate titleWidget = EditInformationTemplate(title: "Title", defaultValue: transaction.title);
  late final EditInformationTemplate messageWidget = EditInformationTemplate(title: "Message", defaultValue: transaction.message!);
  late final EditInformationTemplate processDateWidget = EditInformationTemplate(title: "Date", defaultValue: DateFormat('dd.MM.yyyy, HH:mm').format(DateTime.now()));
  late final EditInformationTemplate amountWidget = EditInformationTemplate(title: "Amount", defaultValue: "${transaction.amount} €");
  late final EditInformationTemplate typeWidget = EditInformationTemplate(title: "Type", defaultValue: transaction.type.toUpperCase());
  late final EditInformationTemplate merchantWidget = EditInformationTemplate(title: "Merchant", defaultValue: transaction.merchant);

  @override
  State<InformationEdit> createState() => _InformationEditState();

  Future<void> saveData(BuildContext context) async {
    TransactionProvider provider = await DatabaseHelper.getTransactionsProvider();
    Transaction temp = Transaction(
        transaction.id,
        transaction.accountId,
        titleWidget.getController().value.text,
        typeWidget.getController().value.text.toLowerCase(),
        merchantWidget.getController().value.text,
        statusWidget.getController().value.text,
        DateFormat('dd.MM.yyyy, HH:mm').parse(processDateWidget.getController().value.text),
        messageWidget.getController().value.text,
        transaction.spendingGoalId,
        double.parse(amountWidget.getController().value.text.replaceAll(" €", "")),
        transaction.pathToIcon
    );

    await provider.update(temp, (transaction.amount - temp.amount)).then((value) => Navigator.pushReplacement(
      context,
      NoAnimationMaterialPageRoute(builder: (context) => TransactionDisplayScreen(transaction: temp,)),
    ));
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

              widget.messageWidget,

              widget.processDateWidget,
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