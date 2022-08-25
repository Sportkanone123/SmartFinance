import 'package:flutter/material.dart';
import 'package:smart_finance/ui/screens/home_screen/home_screen.dart';

import '../constants.dart';
import 'no_animation_material_page_router.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({Key? key, required this.selected}) : super(key: key);

  //1. Home; 2. Insights; 3. Payment; 4. Cards; 5. Settings
  final int selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
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
            color: const Color(0xFF3F404A).withOpacity(0.25),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButtonWithText(
              iconData: Icons.home,
              name: "Home",
              routeTo: const HomeScreen(),
              selected: (selected == 1) ? true : false,
          ),
          IconButtonWithText(
            iconData: Icons.pie_chart,
            name: "Insights",
            routeTo: const HomeScreen(),
            selected: (selected == 2) ? true : false,
          ),
          IconButtonWithText(
            iconData: Icons.compare_arrows,
            name: "Payment",
            routeTo: const HomeScreen(),
            selected: (selected == 3) ? true : false,
          ),
          IconButtonWithText(
            iconData: Icons.credit_card,
            name: "Cards",
            routeTo: const HomeScreen(),
            selected: (selected == 4) ? true : false,
          ),
          IconButtonWithText(
            iconData: Icons.settings,
            name: "Settings",
            routeTo: const HomeScreen(),
            selected: (selected == 5) ? true : false,
          ),
        ],
      ),
    );
  }
}

class IconButtonWithText extends StatelessWidget {
  const IconButtonWithText({Key? key, required this.iconData, required this.name, required this.routeTo, required this.selected}) : super(key: key);

  final IconData iconData;
  final String name;
  final Widget routeTo;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    Color color = (selected) ? const Color(0xFF5D58D0) : const Color(0xFF989898);

    return InkWell(
      onTap: (){
        Navigator.pushReplacement(
          context,
          NoAnimationMaterialPageRoute(builder: (context) => routeTo),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconData, color: color, size: 28,),
          Text(name, style: TextStyle(color: color, fontSize: 10),),
        ],
      ),
    );
  }
}