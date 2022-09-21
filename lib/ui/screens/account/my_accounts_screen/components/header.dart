import 'package:flutter/material.dart';
import 'package:smart_finance/ui/components/no_animation_material_page_router.dart';
import 'package:smart_finance/ui/screens/account/account_add_screen/account_add_screen.dart';
import 'package:smart_finance/ui/screens/home_screen/home_screen.dart';

import '../../../../constants.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(kDefaultPadding, kDefaultPadding / 2, kDefaultPadding, kDefaultPadding / 2),
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      NoAnimationMaterialPageRoute(builder: (context) => const HomeScreen()),
                    );
                  },
                  child: const Text("◀ Home", style: TextStyle(fontSize: 16, color: Colors.blue),),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      NoAnimationMaterialPageRoute(builder: (context) => const AccountAddScreen()),
                    );
                  },
                  child: const Text("Add  ▶", style: TextStyle(fontSize: 16, color: Colors.blue),),
                ),
              ],
            ),
            const SizedBox(height: kDefaultPadding,),
            const Text(
              "My accounts",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ],
        )
    );
  }
}