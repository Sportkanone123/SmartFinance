import 'package:sqflite/sqflite.dart' hide Transaction;

import '../objects/Goal.dart';

const String tableAccount = 'goals_database';
const String columnId = 'id';
const String columnTitle = 'title';
const String columnDescription = 'description';
const String columnStatus = 'status';
const String columnGoalBalance = 'goal_balance';
const String columnSavingBalance = 'saving_balance';
const String columnColor = 'color';
const String columnPathToIcon = 'pathToIcon';

class GoalProvider {
  Database? db;

  Future open(String path) async {
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute('''
            create table $tableAccount (
            $columnId integer primary key autoincrement,
            $columnTitle text not null,
            $columnDescription text not null,
            $columnStatus text not null,
            $columnGoalBalance real not null,
            $columnSavingBalance real not null,
            $columnColor text not null,
            $columnPathToIcon text not null );
          ''');
        });
  }

  Future<Goal> insert(Goal goal) async {
    goal.id = await db!.insert(tableAccount, goal.toMap());
    return goal;
  }

  Future<Goal?> getTodo(int id) async {
    List<Map> maps = await db!.query(tableAccount,
        columns: [columnId, columnTitle, columnDescription, columnStatus, columnGoalBalance, columnSavingBalance, columnColor, columnPathToIcon],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return Goal.fromMap(maps.first as Map<String, Object?>);
    }
    return null;
  }

  Future<int> delete(int id) async {
    return await db!.delete(tableAccount, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<void> clearTable() async {
    return await db!.execute("DELETE FROM $tableAccount;");
  }

  Future<int> update(Goal goal) async {
    return await db!.update(tableAccount, goal.toMap(),
        where: '$columnId = ?', whereArgs: [goal.id]);
  }

  Future close() async => db!.close();

  bool isOpen(){ return db != null; }
}