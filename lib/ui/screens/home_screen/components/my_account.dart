import 'package:flutter/material.dart';
import 'package:smart_finance/ui/templates/page_entry_template.dart';

import '../../../constants.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({Key? key, required this.size}) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return PageEntryExtendOption(
        title: "My accounts",
        extendWidget: Container( color: Colors.green,),
        child: Container(color: Colors.green, height: 32, width: double.infinity,),
    );
  }
}