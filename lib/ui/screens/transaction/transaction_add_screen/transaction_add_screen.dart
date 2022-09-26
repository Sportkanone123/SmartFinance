import 'package:flutter/material.dart';

import '../../../components/my_bottom_nav_bar.dart';
import '../../../constants.dart';
import 'components/body.dart';
import 'components/header.dart';
import 'components/information_add.dart';

class TransactionAddScreen extends StatelessWidget {
  const TransactionAddScreen({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    InformationAdd informationAdd = InformationAdd();

    return Scaffold(
      appBar: buildAppBar(context, informationAdd),
      body:  Body(widget: informationAdd),
      bottomNavigationBar: const MyBottomNavBar(selected: 1,),
      backgroundColor: kBackgroundColor,
    );
  }

  AppBar buildAppBar(BuildContext context, InformationAdd informationAdd) {
    return AppBar(
      toolbarHeight: 55,
      elevation: 0,
      flexibleSpace: Column(
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.width * 0.1,),
          Header(widget: informationAdd),
        ],
      ),
      backgroundColor: const Color(0xFFFAFAFA),
      automaticallyImplyLeading: false,
    );
  }
}