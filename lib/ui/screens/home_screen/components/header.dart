import 'package:flutter/material.dart';

import '../../../constants.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(kDefaultPadding, kDefaultPadding / 2, kDefaultPadding, kDefaultPadding / 2),
      alignment: Alignment.centerLeft,
      child: const Text(
        "Home",
        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }
}