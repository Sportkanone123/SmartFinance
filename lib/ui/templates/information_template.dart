import 'package:flutter/material.dart';

class InformationTemplate extends StatelessWidget {
  final String title;
  final String value;

  const InformationTemplate({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 16, color: Color(0xFF84848A),),),
        Text(value, style: const TextStyle(fontSize: 16, color: Colors.black),),
      ],
    );
  }
}

class InformationTemplateColored extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const InformationTemplateColored({Key? key, required this.title, required this.value, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 16, color: Color(0xFF84848A),),),
        Text(value, style: TextStyle(fontSize: 16, color: color),),
      ],
    );
  }
}