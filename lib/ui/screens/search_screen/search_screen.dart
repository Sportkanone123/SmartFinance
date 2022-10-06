import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/body.dart';
import 'components/header.dart';
import 'components/search_bar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key, required this.search}) : super(key: key);

  final String search;

  @override
  Widget build(context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(keyword: search,),
      backgroundColor: kBackgroundColor,
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 158,
      elevation: 0,
      flexibleSpace: Column(
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.width * 0.1,),
          const Header(),
          SearchBar(defaultValue: search,),
          const Divider(
              color: Colors.grey,
              thickness: 2,
          )
        ],
      ),
      backgroundColor: kBackgroundColor,
      automaticallyImplyLeading: false,
    );
  }
}