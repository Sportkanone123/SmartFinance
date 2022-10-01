import 'package:flutter/material.dart';
import 'package:smart_finance/sql/objects/Transaction.dart';
import 'package:smart_finance/sql/provider/transaction_provider.dart';
import 'package:smart_finance/ui/components/no_animation_material_page_router.dart';
import 'package:smart_finance/ui/screens/transaction/transaction_edit_screen/transaction_edit_screen.dart';
import 'package:smart_finance/ui/screens/transaction/transactions_screen/transactions_screen.dart';

import '../../../../../sql/database_helper.dart';
import '../../../../constants.dart';

class Header extends StatelessWidget {
  const Header({Key? key, required this.amount, required this.transaction}) : super(key: key);

  final double amount;
  final Transaction transaction;

  Future<void> deleteTransaction(Transaction transaction) async {
    TransactionProvider provider =
    await DatabaseHelper.getTransactionsProvider();

    provider.delete(transaction);
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
                  NoAnimationMaterialPageRoute(builder: (context) => const TransactionsScreen()),
                );
              },
              child: const Text("◀ Back", style: TextStyle(fontSize: 16, color: Colors.blue),),
            ),
            Text(amount.toString(), style: const TextStyle(fontSize: 16, color: Color(0xFF84848A)),),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      NoAnimationMaterialPageRoute(builder: (context) => TransactionEditScreen(transaction: transaction)),
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
                    deleteTransaction(transaction).then((value) => Navigator.push(
                      context,
                      NoAnimationMaterialPageRoute(builder: (context) => const TransactionsScreen()),
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
            ),
          ],
        ),
    );
  }
}