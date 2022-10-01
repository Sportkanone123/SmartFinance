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
  runApp(MyApp());

  runTasks();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xFFFAFAFA),
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
}

Future<void> runTasks() async {
  await DatabaseHelper.getTransactionsProvider().then((value) => value.clearTable());
  await DatabaseHelper.getTransactionsProvider().then((value) => value.insert(Transaction(1, 1, "Amazon Order", "payment", "Amazon GmbH", "completed", DateTime.parse('2022-01-14 22:52:13Z'), "Rechnung: #723s4A", null, -149.99, "assets/images/logo.png")));
  await DatabaseHelper.getTransactionsProvider().then((value) => value.insert(Transaction(2, 1, "Salary", "receipt", "ABC Media GmbH", "pending", DateTime.parse('2022-01-01 20:41:01Z'), "January 2022", null, 7563.00, "assets/images/logo.png")));
  await DatabaseHelper.getTransactionsProvider().then((value) => value.insert(Transaction(3, 1, "Salary", "receipt", "ABC Media GmbH", "completed", DateTime.parse('2022-02-14 10:59:00Z'), "February 2022", null, 7545.00, "assets/images/logo.png")));
  await DatabaseHelper.getTransactionsProvider().then((value) => value.insert(Transaction(4, 1, "Shoes", "purchase", "Shoe Company GmbH", "pending", DateTime.parse('2022-01-02 19:15:18Z'), null, null, -59.99, "assets/images/logo.png")));
  await DatabaseHelper.getTransactionsProvider().then((value) => value.insert(Transaction(5, 1, "Withdrawl", "withdrawl", "Sparkasse BC GmbH", "completed", DateTime.parse('2022-01-25 20:07:33Z'), "ID:045450455", null, -1050, "assets/images/logo.png")));
  await DatabaseHelper.getTransactionsProvider().then((value) => value.insert(Transaction(6, 2, "GamesCom Messe", "purchase", "GamesCom GmbH", "complete", DateTime.parse('2022-01-17 12:49:58Z'), null, null, -99.99, "assets/images/logo.png")));
  await DatabaseHelper.getTransactionsProvider().then((value) => value.insert(Transaction(7, 2, "Meeting Room", "payment", "OpenSpace GmbH", "completed", DateTime.parse('2022-01-17 12:49:58Z'), "Trans. ID: 7F78gd7", null, -899.99, "assets/images/logo.png")));
  await DatabaseHelper.getTransactionsProvider().then((value) => value.insert(Transaction(8, 2, "IBM Center", "payment", "IBM GmbH", "complete", DateTime.parse('2022-02-23 02:21:43Z'), "#245g45", null, -199.99, "assets/images/logo.png")));
  await DatabaseHelper.getTransactionsProvider().then((value) => value.insert(Transaction(9, 2, "Payback", "receipt", "ABC Media GmbH", "completed", DateTime.parse('2022-02-01 02:21:43'), null, null, 999.98, "assets/images/logo.png")));

  await DatabaseHelper.getAccountProvider().then((value) => value.clearTable());
  await DatabaseHelper.getAccountProvider().then((value) => value.insert(Account(1, "Private Account", "master_card", "DE12 1234 5678 91 	", 12589, 5000, "assets/images/logo.png", DateTime.parse('22022-08-06 04:22:04'), DateTime.parse('2022-02-14 10:59:00'))));
  await DatabaseHelper.getAccountProvider().then((value) => value.insert(Account(2, "Work Account", "credit_card", "EN98 9876 5432 10", -199.99, 8250, "assets/images/logo.png", DateTime.parse('2022-08-28 16:44:23'), DateTime.parse('2022-02-23 02:21:43'))));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

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
}