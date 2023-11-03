import 'package:flutter/material.dart';
import 'package:smart_finance/sql/objects/Transaction.dart';
import 'package:smart_finance/ui/screens/transaction/transaction_edit_screen/components/information_edit.dart';

import '../../../components/my_bottom_nav_bar.dart';
import '../../../constants.dart';
import 'components/body.dart';
import 'components/header.dart';

class TransactionEditScreen extends StatelessWidget {
  const TransactionEditScreen({Key? key, required this.transaction}) : super(key: key);

  final Transaction transaction;

  @override
  Widget build(context) {
    InformationEdit informationEdit = InformationEdit(transaction: transaction);

    return Scaffold(
      appBar: buildAppBar(context, informationEdit),
      body:  Body(transaction: transaction, widget: informationEdit),
      bottomNavigationBar: const MyBottomNavBar(selected: 1,),
      backgroundColor: kBackgroundColor,
    );
  }

  AppBar buildAppBar(BuildContext context, InformationEdit informationEdit) {
    return AppBar(
      toolbarHeight: 55,
      elevation: 0,
      flexibleSpace: Column(
        children: <Widget>[
          SizedBox(height: 20,),
          Header(amount: transaction.amount, widget: informationEdit),
        ],
      ),
      backgroundColor: const Color(0xFFFAFAFA),
      automaticallyImplyLeading: false,
    );
  }
}