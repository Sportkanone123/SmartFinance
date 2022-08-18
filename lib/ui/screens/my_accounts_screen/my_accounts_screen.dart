import 'package:flutter/material.dart';

import '../../components/my_bottom_nav_bar.dart';
import '../../constants.dart';
import 'components/body.dart';
import 'components/header.dart';

class MyAccountsScreen extends StatelessWidget {
  const MyAccountsScreen({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const Body(),
      bottomNavigationBar: const MyBottomNavBar(selected: 1,),
      backgroundColor: kBackgroundColor,
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 106,
      elevation: 0,
      flexibleSpace: Column(
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.width * 0.1,),
          const Header(),
        ],
      ),
      backgroundColor: kBackgroundColor,
      automaticallyImplyLeading: false,
    );
  }
}