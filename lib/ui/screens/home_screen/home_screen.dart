import 'package:flutter/material.dart';

import '../../components/my_bottom_nav_bar.dart';
import '../../constants.dart';
import 'components/body.dart';
import 'components/header.dart';
import 'components/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: MyBottomNavBar(),
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
          Header(),
          SearchBar(),
        ],
      ),
      backgroundColor: kBackgroundColor,
      automaticallyImplyLeading: false,
    );
  }
}