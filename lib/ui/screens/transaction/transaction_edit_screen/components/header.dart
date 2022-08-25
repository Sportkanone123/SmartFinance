import 'package:flutter/material.dart';
import 'package:smart_finance/sql/objects/Transaction.dart';
import 'package:smart_finance/ui/components/no_animation_material_page_router.dart';
import 'package:smart_finance/ui/screens/home_screen/home_screen.dart';
import 'package:smart_finance/ui/screens/transaction/transaction_edit_screen/components/information_edit.dart';

import '../../../../constants.dart';

class Header extends StatelessWidget {
  const Header({Key? key, required this.amount, required this.widget}) : super(key: key);

  final double amount;
  final InformationEdit widget;

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
                widget.saveData();

                Navigator.pop(context);
              },
              child: const Text("◀ Save", style: TextStyle(fontSize: 16, color: Colors.blue),),
            ),
            Text(amount.toString(), style: const TextStyle(fontSize: 16, color: Color(0xFF84848A)),),
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