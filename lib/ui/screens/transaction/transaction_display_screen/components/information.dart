import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_finance/ui/templates/information_template.dart';
import 'package:smart_finance/ui/templates/page_entry_template.dart';

import '../../../../../sql/objects/Transaction.dart';
import '../../../../constants.dart';

class Information extends StatelessWidget {
  const Information({Key? key, required this.transaction}) : super(key: key);
  
  final Transaction transaction;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PageEntrySmallTitle(
          title: "INFORMATION",
          child: Wrap(
            runSpacing: kDefaultPadding * 1.5,
            children: [
              if(transaction.status == "completed")
                InformationTemplateColored(title: "Status", value: transaction.status.toUpperCase(), color: Colors.green,)
              else if (transaction.status == "pending")
                InformationTemplateColored(title: "Status", value: transaction.status.toUpperCase(), color: Colors.yellow,)
              else
                  InformationTemplateColored(title: "Status", value: transaction.status.toUpperCase(), color: Colors.red,),

              InformationTemplate(title: "Title", value: transaction.title),

              if (transaction.message != null)
                InformationTemplate(title: "Message", value: transaction.message!),

              InformationTemplate(title: "Date", value: DateFormat('dd MMMM yyyy, HH:mm').format(transaction.processDateTime)),
              InformationTemplate(title: "Amount", value: "${transaction.amount} €"),
              InformationTemplate(title: "Type", value: transaction.type.toUpperCase()),

              if(transaction.type == "receipt")
                InformationTemplate(title: "Merchant", value: transaction.merchant),
            ],
          ),
        ),
      ],
    );
  }
}