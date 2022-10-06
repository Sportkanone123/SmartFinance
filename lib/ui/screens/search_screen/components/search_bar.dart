import 'package:flutter/material.dart';
import 'package:smart_finance/ui/screens/search_screen/search_screen.dart';

import '../../../components/no_animation_material_page_router.dart';
import '../../../constants.dart';
import '../../account/account_display_screen/account_display_screen.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key, required this.defaultValue}) : super(key: key);
  final String defaultValue;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late TextEditingController searchController = TextEditingController(text: widget.defaultValue);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(kDefaultPadding, kDefaultPadding / 2, kDefaultPadding, kDefaultPadding / 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: TextInput(
                textString: "Search",
                textController: searchController,
                obscureText: false
            ),
          ),
          const SizedBox(width: 10),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(
                context,
                NoAnimationMaterialPageRoute(builder: (context) => SearchScreen(search: searchController.value.text)),
              );
            },
            child: Container(
              height: 32,
              width: 32,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
              child: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextInput extends StatelessWidget {
  final String textString;
  final TextEditingController textController;
  final bool obscureText;

  const TextInput(
      {Key? key,
        required this.textString,
        required this.textController,
        required this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 32,
        width: double.infinity,
        padding: const EdgeInsets.only(left: 12),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Color(0xFFE1E1E6),
        ),
        child: TextField(
          style: const TextStyle(color: Color(0xFF84848A), fontSize: 14),
          maxLines: 1,
          cursorColor: kBackgroundColor,
          controller: textController,
          keyboardType: TextInputType.text,
          obscureText: obscureText,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: textString,
            hintStyle: const TextStyle(
                color: Color(0xFF84848A),
                fontSize: 14,
                fontWeight: FontWeight.normal),
          ),
        ));
  }
}
