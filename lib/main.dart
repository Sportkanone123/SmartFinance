import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:smart_finance/sql/database_helper.dart';
import 'package:smart_finance/sql/objects/Account.dart';
import 'package:smart_finance/ui/constants.dart';
import 'package:smart_finance/ui/screens/home_screen/home_screen.dart';
import 'package:smart_finance/ui/screens/login_screen/login_screen.dart';
import 'package:smart_finance/utils/authentication.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  //final SocketService service = SocketService();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    //runTasks();

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
    await DatabaseHelper().getAccountProvider().then((value) => value.clearTable());
    await DatabaseHelper().getAccountProvider().then((value) => value.insert(Account(1, "Test Account", "master_card", "DE12345678910111213141", 13.59, 100.00, "/random/path/to/icon/icon.png", DateTime.now(), DateTime.now())));
    await DatabaseHelper().getAccountProvider().then((value) => value.getTodo(1).then((value) => print(value!.balance.toString())));
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          Authentication.authenticateWithBiometrics().then((value) =>
          {
            if (value) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              ),
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                Authentication.customSnackBar(
                  content: 'Error authenticating using Biometrics.',
                ),
              )
            }
          });
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            Text('Authenticate'),
            Icon(Icons.perm_device_information),
          ],
        ),
      );
    }
}