import 'package:flutter/material.dart';

import '../components/no_animation_material_page_router.dart';

class OptionTemplate extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String description;
  final Widget routeTo;

  const OptionTemplate({Key? key, required this.icon, required this.iconColor, required this.title, required this.description, required this.routeTo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushReplacement(
          context,
          NoAnimationMaterialPageRoute(builder: (context) => routeTo),
        );
      },
      child: Row(
        children: [
          Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: iconColor,
            ),
            child: Icon(icon, size: 24, color: Colors.white,),
          ),
          const SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 16, color: Colors.black),),
                const SizedBox(height: 2,),
                Text(description, style: const TextStyle(fontSize: 12, color: Color(0xFF84848A),),),
              ],
            ),
          ),
          const Text("▶", style: TextStyle(fontSize: 20, color: Color(0xFF84848A), fontWeight: FontWeight.bold),),
        ],
      )
    );
  }
}