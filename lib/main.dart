import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_finance/sql/database_helper.dart';
import 'package:smart_finance/sql/objects/Account.dart';
import 'package:smart_finance/sql/objects/Transaction.dart';
import 'package:smart_finance/ui/constants.dart';
import 'package:smart_finance/ui/screens/home_screen/home_screen.dart';
import 'package:smart_finance/ui/screens/login_screen/login_screen.dart';
import 'package:smart_finance/ui/templates/account/account_template.dart';
import 'package:smart_finance/utils/authentication.dart';

void main() {
  runApp(const MyApp());

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xFFFAFAFA),
    systemNavigationBarIconBrightness: Brightness.dark,
  ));


}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SmartFinance',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColorBackground),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LoginScreen(),
    );
  }
}