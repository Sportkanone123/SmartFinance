import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_finance/ui/screens/transaction/transaction_edit_screen/components/information_edit.dart';
import 'package:smart_finance/utils/date_time_picker.dart';

import '../constants.dart';


class EditInformationTemplate extends StatefulWidget {
  late final TextEditingController textController = TextEditingController(text: defaultValue);

  final String title;
  final String defaultValue;

  EditInformationTemplate({Key? key, required this.title, required this.defaultValue}) : super(key: key);

  @override
  State<EditInformationTemplate> createState() => _EditInformationTemplateState();

  TextEditingController getController(){
    return textController;
  }
}

class _EditInformationTemplateState extends State<EditInformationTemplate> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Text(widget.title, style: const TextStyle(fontSize: 16, color: Color(0xFF84848A),),),),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: TextInput(textString: widget.title, textController: widget.textController, obscureText: false, ),
        )
      ],
    );
  }
}


class EditDateTimeInformationTemplate extends StatefulWidget {
  late final TextEditingController textController = TextEditingController(text: defaultValue);

  final String title;
  final String defaultValue;

  EditDateTimeInformationTemplate({Key? key, required this.title, required this.defaultValue}) : super(key: key);

  @override
  State<EditDateTimeInformationTemplate> createState() => EditDateTimeInformationTemplateState();

  TextEditingController getController(){
    return textController;
  }
}

class EditDateTimeInformationTemplateState extends State<EditDateTimeInformationTemplate> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Text(widget.title, style: const TextStyle(fontSize: 16, color: Color(0xFF84848A),),),),
        GestureDetector(
          onTap: () {
            DateTimePicker instance = DateTimePicker();
            instance.selectDateTime(context);
          },
          child: Container(
            height: 32,
            width: MediaQuery.of(context).size.width * 0.6,
            padding: const EdgeInsets.only(left: 12),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              color: Color(0xFFE1E1E6),
            ),
            alignment: Alignment.centerLeft,
            child: Text(DateFormat('dd MMMM yyyy, HH:mm').format(DateTime.parse(widget.textController.value.text)), style: const TextStyle(color: Color(0xFF84848A), fontSize: 14),),
          ),
        )
      ],
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
          keyboardType: TextInputType.name,
          obscureText: obscureText,
          autocorrect: false,
          showCursor: false,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: textString,
            hintStyle: const TextStyle(
                color: Color(0xFF84848A),
                fontSize: 14,
                fontWeight: FontWeight.normal),
          ),
          textInputAction: TextInputAction.none,
        ));
  }
}