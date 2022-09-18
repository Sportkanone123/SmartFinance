import 'package:flutter/material.dart';
import 'package:smart_finance/sql/objects/Account.dart';

import '../../../components/my_bottom_nav_bar.dart';
import '../../../constants.dart';
import 'components/information_edit.dart';
import 'components/body.dart';
import 'components/header.dart';

class InformationEditScreen extends StatelessWidget {
  const InformationEditScreen({Key? key, required this.account}) : super(key: key);

  final Account account;

  @override
  Widget build(context) {
    InformationEdit informationEdit = InformationEdit(account: account);

    return Scaffold(
      appBar: buildAppBar(context, informationEdit),
      body:  Body(account: account, widget: informationEdit),
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
          SizedBox(height: MediaQuery.of(context).size.width * 0.1,),
          Header(account: account, widget: informationEdit),
        ],
      ),
      backgroundColor: const Color(0xFFFAFAFA),
      automaticallyImplyLeading: false,
    );
  }
}