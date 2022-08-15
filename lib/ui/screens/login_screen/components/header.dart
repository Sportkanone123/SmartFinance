import 'package:flutter/material.dart';

import '../../../constants.dart';

class Header extends StatelessWidget {
  const Header({Key? key, required this.size}) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.25,
      width: size.width,
      margin: const EdgeInsets.only(bottom: kDefaultPadding * 2 ),
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(
              top: kDefaultPadding * 3,
              left: kDefaultPadding,
              right: kDefaultPadding,
              bottom: kDefaultPadding,
            ),
            height: size.height * 0.25,
            width: size.width,
            decoration: const BoxDecoration(
              color: Color(0xFF4050fa),
              borderRadius:BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const <Widget>[
                Text(
                  "Welcome Back!",
                  style: TextStyle(fontSize: 32,color: Colors.white)
                ),
                SizedBox(height: kDefaultPadding * 0.2),
                Text(
                    "Fast and Secure Login",
                    style: TextStyle(fontSize: 14,color: Colors.white)
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
