import 'package:flutter/material.dart';
import 'package:smart_finance/ui/screens/login_screen/components/verify.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: const <Widget>[
        Verify(),
      ],
    );
  }
}
