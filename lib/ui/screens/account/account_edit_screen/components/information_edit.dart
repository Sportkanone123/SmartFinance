import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_finance/sql/provider/account_provider.dart';
import 'package:smart_finance/sql/provider/transaction_provider.dart';
import 'package:smart_finance/ui/templates/page_entry_template.dart';

import '../../../../../sql/database_helper.dart';
import '../../../../../sql/objects/Account.dart';
import '../../../../../sql/objects/Transaction.dart';
import '../../../../components/no_animation_material_page_router.dart';
import '../../../../constants.dart';
import '../../../../templates/edit_information_template.dart';
import '../../account_display_screen/account_display_screen.dart';

class InformationEdit extends StatefulWidget {
  InformationEdit({Key? key, required this.account}) : super(key: key);

  final Account account;

  late final EditInformationTemplate titleWidget = EditInformationTemplate(title: "Title", defaultValue: account.title);
  late final EditInformationTemplate typeWidget = EditInformationTemplate(title: "Type", defaultValue: account.type);
  late final EditInformationTemplate accountNumberWidget = EditInformationTemplate(title: "Account Number", defaultValue: account.accountNumber);
  late final EditInformationTemplate balanceWidget = EditInformationTemplate(title: "Balance", defaultValue: "${account.balance} €");
  late final EditInformationTemplate limitWidget = EditInformationTemplate(title: "Limit", defaultValue: "${account.spendLimit} €");
  late final EditInformationTemplate expirationDateWidget = EditInformationTemplate(title: "Expiration date", defaultValue: DateFormat('dd.MM.yyyy, HH:mm').format(account.expirationDate));
  late final EditInformationTemplate lastUsedWidget = EditInformationTemplate(title: "Last Used", defaultValue: DateFormat('dd.MM.yyyy, HH:mm').format(account.lastUsed));

  @override
  State<InformationEdit> createState() => _InformationEditState();

  Future<void> saveData(BuildContext context) async {
    AccountProvider provider = await DatabaseHelper.getAccountProvider();
    Account temp = Account(
        account.id,
        titleWidget.getController().value.text,
        typeWidget.getController().value.text,
        accountNumberWidget.getController().value.text,
        double.parse(balanceWidget.getController().value.text.replaceAll(" €", "")),
        double.parse(limitWidget.getController().value.text.replaceAll(" €", "")),
        account.pathToIcon,
        DateFormat('dd.MM.yyyy, HH:mm').parse(expirationDateWidget.textController.value.text),
        DateFormat('dd.MM.yyyy, HH:mm').parse(lastUsedWidget.textController.value.text),
    );

    provider.update(temp).then((value) => Navigator.pushReplacement(
      context,
      NoAnimationMaterialPageRoute(builder: (context) => AccountDisplayScreen(account: temp,)),
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