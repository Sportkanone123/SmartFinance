import 'package:flutter/material.dart';
import 'package:smart_finance/sql/objects/Account.dart';
import 'package:smart_finance/sql/objects/Transaction.dart';
import 'package:smart_finance/ui/components/no_animation_material_page_router.dart';
import 'package:smart_finance/ui/screens/account/account_display_screen/account_display_screen.dart';
import 'package:smart_finance/ui/screens/home_screen/home_screen.dart';
import 'package:smart_finance/ui/screens/transaction/transaction_edit_screen/transaction_edit_screen.dart';

import '../../../../../sql/database_helper.dart';
import '../../../../../sql/provider/account_provider.dart';
import '../../../../constants.dart';
import '../../account_edit_screen/account_edit_screen.dart';
import '../../my_accounts_screen/my_accounts_screen.dart';

class Header extends StatelessWidget {
  const Header({Key? key, required this.account}) : super(key: key);

  final Account account;

  Future<void> deleteAccount(Account account) async {
    AccountProvider provider =
        await DatabaseHelper.getAccountProvider();

    provider.delete(account.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(kDefaultPadding, kDefaultPadding / 2, kDefaultPadding, kDefaultPadding / 2),
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  NoAnimationMaterialPageRoute(builder: (context) => const MyAccountsScreen()),
                );
              },
              child: const Text("◀ Back", style: TextStyle(fontSize: 16, color: Colors.blue),),
            ),
            Text(account.title.toString(), style: const TextStyle(fontSize: 16, color: Color(0xFF84848A)),),
            Row(

              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      NoAnimationMaterialPageRoute(builder: (context) => AccountEditScreen(account: account)),
                    );
                  },
                  child: Container(
                    height: 24,
                    width: 42,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: Color(0xFFE1E1E6),
                    ),
                    alignment: Alignment.center,
                    child: const Text("Edit", style: TextStyle(color: Colors.blue),),
                  ),
                ),
                const SizedBox(width: 6,),
                InkWell(
                  onTap: () {
                    deleteAccount(account).then((value) => Navigator.push(
                      context,
                      NoAnimationMaterialPageRoute(builder: (context) => const MyAccountsScreen()),
                    ));
                  },
                  child: Container(
                    height: 24,
                    width: 56,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: Color(0xFFE1E1E6),
                    ),
                    alignment: Alignment.center,
                    child: const Text("Delete", style: TextStyle(color: Colors.blue,)),
                  ),
                ),
              ],
            )
          ],
        )
    );
  }
}