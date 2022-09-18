import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_finance/sql/objects/Account.dart';
import 'package:smart_finance/ui/screens/account/account_display_screen/account_display_screen.dart';

import '../../components/no_animation_material_page_router.dart';

class AccountTemplate extends StatelessWidget {
  final Account account;

  const AccountTemplate({Key? key, required this.account})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(account.pathToIcon, width: 32, height: 32,),
        const SizedBox(width: 10,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(account.title, style: const TextStyle(fontSize: 16, color: Colors.black),),
              const SizedBox(height: 2,),
              Text("${account.balance} €", style: const TextStyle(fontSize: 12, color: Color(0xFF84848A),),),
            ],
          ),
        ),
        InkWell(
          onTap: (){
            Navigator.push(
              context,
              NoAnimationMaterialPageRoute(builder: (context) => AccountDisplayScreen(account: account)),
            );
          },
          child: Container(
            height: 24,
            width: 56,
            padding: const EdgeInsets.only(left: 12),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              color: Color(0xFFE1E1E6),
            ),
            alignment: Alignment.centerLeft,
            child: const Text("VIEW", style: TextStyle(color: Colors.blue),),
          ),
        )
      ],
    );
  }
}