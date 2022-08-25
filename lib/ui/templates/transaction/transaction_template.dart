import 'package:flutter/material.dart';
import 'package:smart_finance/ui/screens/transaction/transaction_display_screen/transaction_display_screen.dart';

import '../../../sql/objects/Transaction.dart';
import '../../components/no_animation_material_page_router.dart';

class TransactionTemplate extends StatelessWidget {
  final Transaction transaction;

  const TransactionTemplate({Key? key, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          NoAnimationMaterialPageRoute(builder: (context) => TransactionDisplayScreen(transaction: transaction)),
        );
      },
      child: Row(
        children: [
          Image.asset(transaction.pathToIcon, width: 32, height: 32,),
          const SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(transaction.title, style: const TextStyle(fontSize: 16, color: Colors.black),),
                    ),
                    (transaction.amount < 0)
                        ? Text("- ${transaction.amount.toString().replaceFirst("-", "")} €", style: const TextStyle(fontSize: 12, color: Colors.red),)
                        : Text("+ ${transaction.amount} €", style: const TextStyle(fontSize: 12, color: Colors.green),),
                  ],
                ),
                const SizedBox(height: 2,),
                Text(transaction.processDateTime.toString(), style: const TextStyle(fontSize: 12, color: Color(0xFF84848A),),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}