import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return const Scaffold(
      backgroundColor: kBackgroundColor,
      body: Body(),
    );
  }
}