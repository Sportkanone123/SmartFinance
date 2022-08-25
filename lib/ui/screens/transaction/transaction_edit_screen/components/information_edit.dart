import 'package:flutter/material.dart';
import 'package:smart_finance/ui/templates/page_entry_template.dart';

import '../../../../../sql/objects/Transaction.dart';
import '../../../../constants.dart';
import '../../../../templates/edit_information_template.dart';

class InformationEdit extends StatefulWidget {
  InformationEdit({Key? key, required this.transaction}) : super(key: key);

  final Transaction transaction;

  late DateTime dateValue = transaction.processDateTime;

  @override
  State<InformationEdit> createState() => _InformationEditState();

  void saveData(){
    //ToDo save data
    print(dateValue.toString());
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
              if(widget.transaction.status == "completed")
                EditInformationTemplate(title: "Status", defaultValue: widget.transaction.status.toUpperCase())
              else if (widget.transaction.status == "pending")
                EditInformationTemplate(title: "Status", defaultValue: widget.transaction.status.toUpperCase())
              else
                EditInformationTemplate(title: "Status", defaultValue: widget.transaction.status.toUpperCase()),

              EditInformationTemplate(title: "Title", defaultValue: widget.transaction.title),

              if (widget.transaction.message != null)
                EditInformationTemplate(title: "Message", defaultValue: widget.transaction.message!),

              EditDateTimeInformationTemplate(title: "Date", defaultValue: widget.transaction.processDateTime, informationEdit: widget,),
              EditInformationTemplate(title: "Amount", defaultValue: "${widget.transaction.amount} €"),
              EditInformationTemplate(title: "Type", defaultValue: widget.transaction.type.toUpperCase()),
              if(widget.transaction.type == "receipt")
                EditInformationTemplate(title: "Merchant", defaultValue: widget.transaction.merchant),
            ],
          ),
        ),
      ],
    );
  }
}