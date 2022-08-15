import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return const Scaffold(
      backgroundColor: kBackgroundColor,
      body: Body(),
    );
  }
}