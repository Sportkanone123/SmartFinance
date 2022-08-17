import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../templates/option_template.dart';
import '../../../templates/page_entry_template.dart';

class Options extends StatelessWidget {
  const Options({Key? key, required this.size}) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return PageEntryBoldTitle(
      title: "Options",
      child: Wrap(
        runSpacing: kDefaultPadding * 1.5,
        children: [
          OptionTemplate(icon: Icons.credit_card, iconColor: Colors.indigo, title: "Pay your bills", description: "You can pay all your bills here", routeTo: Container(color: Colors.yellow,)),
          OptionTemplate(icon: Icons.calculate, iconColor: Colors.orange, title: "Getting a home loan", description: "See your credit report now", routeTo: Container(color: Colors.yellow,)),
          OptionTemplate(icon: Icons.category, iconColor: Colors.green, title: "Set up a budget", description: "Manage your spending", routeTo: Container(color: Colors.yellow,))
        ],
      )
    );
  }
}