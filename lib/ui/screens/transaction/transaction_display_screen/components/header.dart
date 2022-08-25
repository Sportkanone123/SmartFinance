import 'package:flutter/material.dart';
import 'package:smart_finance/sql/objects/Transaction.dart';
import 'package:smart_finance/ui/components/no_animation_material_page_router.dart';
import 'package:smart_finance/ui/screens/home_screen/home_screen.dart';
import 'package:smart_finance/ui/screens/transaction/transaction_edit_screen/transaction_edit_screen.dart';

import '../../../../constants.dart';

class Header extends StatelessWidget {
  const Header({Key? key, required this.amount, required this.transaction}) : super(key: key);

  final double amount;
  final Transaction transaction;

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
                Navigator.pop(context);
              },
              child: const Text("◀ Back", style: TextStyle(fontSize: 16, color: Colors.blue),),
            ),
            Text(amount.toString(), style: const TextStyle(fontSize: 16, color: Color(0xFF84848A)),),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  NoAnimationMaterialPageRoute(builder: (context) => TransactionEditScreen(transaction: transaction)),
                );
              },
              child: const Text("Edit ▶", style: TextStyle(fontSize: 16, color: Colors.blue),),
            ),
          ],
        )
    );
  }
}