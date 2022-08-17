import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../templates/page_entry_template.dart';

class Transactions extends StatelessWidget {
  const Transactions({Key? key, required this.size}) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return PageEntryExtendOption(
      title: "Transactions",
      extendWidget: Container( color: Colors.blue,),
      child: Container(color: Colors.blue, height: 32, width: double.infinity,),
    );
  }
}