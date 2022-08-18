import 'package:flutter/material.dart';
import 'package:smart_finance/ui/screens/my_accounts_screen/components/accounts_display.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return const SingleChildScrollView(
      child: AccountsDisplay(),
    );
  }
}