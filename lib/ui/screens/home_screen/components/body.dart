import 'package:flutter/material.dart';
import 'package:smart_finance/ui/screens/home_screen/components/my_account.dart';
import 'package:smart_finance/ui/screens/home_screen/components/options.dart';
import 'package:smart_finance/ui/screens/home_screen/components/search_bar.dart';
import 'package:smart_finance/ui/screens/home_screen/components/transactions.dart';

import 'header.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          MyAccount(size: size),
          Transactions(size: size),
          Options(size: size),
        ],
      ),
    );
  }
}