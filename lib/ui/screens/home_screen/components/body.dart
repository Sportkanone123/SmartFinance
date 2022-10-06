import 'package:flutter/material.dart';
import 'package:smart_finance/ui/screens/home_screen/components/my_account.dart';
import 'package:smart_finance/ui/screens/home_screen/components/options.dart';
import 'package:smart_finance/ui/screens/home_screen/components/search_bar.dart';
import 'package:smart_finance/ui/screens/home_screen/components/transactions.dart';
import 'package:smart_finance/ui/screens/home_screen/home_screen.dart';

import '../../../../sql/database_helper.dart';
import '../../../../sql/objects/Account.dart';
import '../../../../sql/objects/Transaction.dart';
import '../../../components/no_animation_material_page_router.dart';
import 'header.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const MyAccount(),
          const Transactions(),
          TextButton(
            onPressed: () async {
              await DatabaseHelper.getAccountProvider().then((value) => value.clearTable());
              await DatabaseHelper.getTransactionsProvider().then((value) => value.clearTable());

              Navigator.pushReplacement(
                context,
                NoAnimationMaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
            child: const SizedBox(width: double.maxFinite, child: Text('Reset Values')),
          ),
          TextButton(
            onPressed: () async {
              await DatabaseHelper.getAccountProvider().then((value) => value.insert(Account(1, "Private Account", "master_card", "DE12 1234 5678 91 	", 0, 5000, "assets/images/logo.png", DateTime.parse('22022-08-06 04:22:04'), DateTime.parse('2022-02-14 10:59:00'))));
              await DatabaseHelper.getAccountProvider().then((value) => value.insert(Account(2, "Work Account", "credit_card", "EN98 9876 5432 10", 0, 8250, "assets/images/logo.png", DateTime.parse('2022-08-28 16:44:23'), DateTime.parse('2022-02-23 02:21:43'))));

              await DatabaseHelper.getTransactionsProvider().then((value) => value.insert(Transaction(1, 1, "Amazon Order", "payment", "Amazon GmbH", "completed", DateTime.parse('2022-01-14 22:52:13Z'), "Rechnung: #723s4A", null, -149.99, "assets/images/logo.png")));
              await DatabaseHelper.getTransactionsProvider().then((value) => value.insert(Transaction(2, 1, "Salary", "receipt", "ABC Media GmbH", "pending", DateTime.parse('2022-01-01 20:41:01Z'), "January 2022", null, 7563.00, "assets/images/logo.png")));
              await DatabaseHelper.getTransactionsProvider().then((value) => value.insert(Transaction(3, 1, "Salary", "receipt", "ABC Media GmbH", "completed", DateTime.parse('2022-02-14 10:59:00Z'), "February 2022", null, 7545.00, "assets/images/logo.png")));
              await DatabaseHelper.getTransactionsProvider().then((value) => value.insert(Transaction(4, 1, "Shoes", "purchase", "Shoe Company GmbH", "pending", DateTime.parse('2022-01-02 19:15:18Z'), null, null, -59.99, "assets/images/logo.png")));
              await DatabaseHelper.getTransactionsProvider().then((value) => value.insert(Transaction(5, 1, "Withdrawl", "withdrawl", "Sparkasse BC GmbH", "completed", DateTime.parse('2022-01-25 20:07:33Z'), "ID:045450455", null, -1050, "assets/images/logo.png")));
              await DatabaseHelper.getTransactionsProvider().then((value) => value.insert(Transaction(6, 2, "GamesCom Messe", "purchase", "GamesCom GmbH", "complete", DateTime.parse('2022-01-17 12:49:58Z'), null, null, -99.99, "assets/images/logo.png")));
              await DatabaseHelper.getTransactionsProvider().then((value) => value.insert(Transaction(7, 2, "Meeting Room", "payment", "OpenSpace GmbH", "completed", DateTime.parse('2022-01-17 12:49:58Z'), "Trans. ID: 7F78gd7", null, -899.99, "assets/images/logo.png")));
              await DatabaseHelper.getTransactionsProvider().then((value) => value.insert(Transaction(8, 2, "IBM Center", "payment", "IBM GmbH", "complete", DateTime.parse('2022-02-23 02:21:43Z'), "#245g45", null, -199.99, "assets/images/logo.png")));
              await DatabaseHelper.getTransactionsProvider().then((value) => value.insert(Transaction(9, 2, "Payback", "receipt", "ABC Media GmbH", "completed", DateTime.parse('2022-02-01 02:21:43'), null, null, 999.98, "assets/images/logo.png")));

              Navigator.pushReplacement(
                context,
                NoAnimationMaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
            child: const SizedBox(width: double.maxFinite, child: Text('Add default Values')),
          )
          //Options(size: size), TODO Add options for fast access.
        ],
      ),
    );
  }
}