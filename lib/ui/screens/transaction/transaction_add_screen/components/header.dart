import 'package:flutter/material.dart';
import 'package:smart_finance/ui/components/no_animation_material_page_router.dart';
import 'package:smart_finance/ui/screens/transaction/transaction_display_screen/transaction_display_screen.dart';

import '../../../../../sql/objects/Account.dart';
import '../../../../../sql/objects/Transaction.dart';
import '../../../../constants.dart';
import '../../../account/account_edit_screen/components/information_edit.dart';
import 'information_add.dart';

class Header extends StatelessWidget {
  const Header({Key? key, required this.widget}) : super(key: key);

  final InformationAdd widget;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(kDefaultPadding, kDefaultPadding / 2, kDefaultPadding, kDefaultPadding / 2),
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () async {
                Transaction transaction = await widget.saveData();

                Navigator.pushReplacement(
                  context,
                  NoAnimationMaterialPageRoute(builder: (context) => TransactionDisplayScreen(transaction: transaction,)),
                );
              },
              child: const Text("◀ Save", style: TextStyle(fontSize: 16, color: Colors.blue),),
            ),
            const Text("Add Account", style: TextStyle(fontSize: 16, color: Color(0xFF84848A)),),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Text("Dismiss ▶", style: TextStyle(fontSize: 16, color: Colors.blue),),
            ),
          ],
        )
    );
  }
}