import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_finance/sql/database_helper.dart';
import 'package:smart_finance/sql/objects/Account.dart';
import 'package:smart_finance/sql/objects/Transaction.dart';
import 'package:smart_finance/ui/constants.dart';
import 'package:smart_finance/ui/screens/home_screen/home_screen.dart';
import 'package:smart_finance/ui/screens/login_screen/login_screen.dart';
import 'package:smart_finance/utils/authentication.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xFFFAFAFA),
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    runTasks();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GoFinance',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColorBackground),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LoginScreen(),
    );
  }

  Future<void> runTasks() async {
    await DatabaseHelper.getTransactionsProvider().then((value) => value.clearTable());
    await DatabaseHelper.getTransactionsProvider().then((value) => value.insert(Transaction(1, 1, "Salary payment", "receipt", "PayGoal GmbH", "completed", DateTime.now(), "Salary for January 2022", null, 7654.00, "assets/images/logo.png")));
    await DatabaseHelper.getTransactionsProvider().then((value) => value.insert(Transaction(2, 2, "Dropbox Organization", "payment", "Myself", "pending", DateTime.parse('2022-04-20 00:00:00Z'), null, null, -89.99, "assets/images/logo.png")));
  }
}