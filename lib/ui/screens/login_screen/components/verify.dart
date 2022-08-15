import 'package:flutter/material.dart';
import 'package:smart_finance/ui/constants.dart';

import '../../../../utils/authentication.dart';
import '../../home_screen/home_screen.dart';

class Verify extends StatefulWidget {
  const Verify({Key? key}) : super(key: key);

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {

  @override
  void initState() {
    super.initState();
    Authentication.authenticate().then((value) => {
      if (value) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        ),
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          Authentication.customSnackBar(
            content: 'Error occurred during authenticating.',
          ),
        )
      }
    });
  }

  @override
  Widget build(BuildContext context) {
      return Container(
        padding: const EdgeInsets.only(bottom: kDefaultPadding * 2),
        child: ElevatedButton(
          onPressed: () async {
            Authentication.authenticate().then((value) =>
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
                    content: 'Error occurred during authenticating.',
                  ),
                )
              }
            });
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const <Widget>[
              Text('Try Again'),
              Icon(Icons.perm_device_information),
            ],
          ),
        ),
      );
    }
}