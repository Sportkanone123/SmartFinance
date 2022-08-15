import 'package:flutter/material.dart';

const String tableAccount = 'goals_database';
const String columnId = 'id';
const String columnTitle = 'title';
const String columnDescription = 'description';
const String columnStatus = 'status';
const String columnGoalBalance = 'goal_balance';
const String columnSavingBalance = 'saving_balance';
const String columnColor = 'color';
const String columnPathToIcon = 'pathToIcon';

class Goal {
  late int? id;
  late String title;
  late String description;
  late String status;
  late double goalBalance;
  late double savingBalance;
  late Color color;
  late String pathToIcon;


  Goal(this.id, this.title, this.description, this.status, this.goalBalance,
      this.savingBalance, this.color, this.pathToIcon);

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      columnTitle: title,
      columnDescription: description,
      columnStatus: status,
      columnGoalBalance: goalBalance,
      columnSavingBalance: savingBalance,
      columnColor: color.toHex(),
      columnPathToIcon: pathToIcon,
    };

    if (id != null) {
      map[columnId] = id;
    }

    return map;
  }

  Goal.fromMap(Map<String, Object?> map) {
    id = map[columnId] as int;
    title = map[columnTitle] as String;
    description = map[columnDescription] as String;
    status = map[columnStatus] as String;
    goalBalance = map[columnGoalBalance] as double;
    savingBalance = map[columnSavingBalance] as double;
    color = HexColor.fromHex([columnColor] as String);
    pathToIcon = map[columnPathToIcon] as String;
  }
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}'
      '${alpha.toRadixString(16).padLeft(2, '0')}';
}
