import 'package:flutter/material.dart';
import 'package:smart_finance/ui/screens/home_screen/home_screen.dart';

import '../constants.dart';
import 'no_animation_material_page_router.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.only(
        left: kDefaultPadding * 2,
        right: kDefaultPadding * 2,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFA),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -10),
            blurRadius: 35,
            color: const Color(0xFF3F404A).withOpacity(0.38),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.home,
              color: Colors.white,
            ),
            iconSize: 30,
            onPressed: (){
              Navigator.push(context,
                NoAnimationMaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.pie_chart,
              color: Colors.white,
            ),
            iconSize: 30,
            onPressed: (){
              Navigator.push(context,
                NoAnimationMaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.compare_arrows,
              color: Colors.white,
            ),
            iconSize: 30,
            onPressed: (){
              Navigator.push(context,
                NoAnimationMaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.credit_card,
              color: Colors.white,
            ),
            iconSize: 30,
            onPressed: (){
              Navigator.push(context,
                NoAnimationMaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            iconSize: 30,
            onPressed: (){
              Navigator.push(context,
                NoAnimationMaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}