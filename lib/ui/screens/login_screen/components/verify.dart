import 'dart:math';

import 'package:flutter/material.dart';
import 'package:smart_finance/ui/components/no_animation_material_page_router.dart';
import 'package:smart_finance/ui/constants.dart';
import 'package:smart_finance/utils/secure_storage.dart';

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
          NoAnimationMaterialPageRoute(
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
      return Container();
    }
}

Future<void> createDatabasePasswords() async {
  if(await SecureStorage.read("transactions_pswd") == null){
    await SecureStorage.add("transactions_pswd", getRandomString(32));
  }

  if(await SecureStorage.read("accounts_pswd") == null){
    await SecureStorage.add("accounts_pswd", getRandomString(32));
  }
}

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890@€!§%&/()=?*+~*#-_.:,;';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
