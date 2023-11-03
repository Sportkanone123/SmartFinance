import 'package:sqflite/sqflite.dart' hide Transaction;
import '../objects/Template.dart';

const String tableAccount = 'goals_database';
const String columnId = 'id';
const String columnTitle = 'title';
const String columnDescription = 'description';
const String columnDocumentation = 'documentation';
const String columnBalance = 'balance';
const String columnColor = 'color';
const String columnPathToIcon = 'pathToIcon';

class TemplateProvider {
  Database? db;

  Future open(String path) async {
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute('''
            create table $tableAccount (
            $columnId integer primary key autoincrement,
            $columnTitle text not null,
            $columnDescription text not null,
            $columnDocumentation text not null,
            $columnBalance real not null,
            $columnColor text not null,
            $columnPathToIcon text not null );
          ''');
        });
  }

  Future<Template> insert(Template template) async {
    template.id = await db!.insert(tableAccount, template.toMap());
    return template;
  }

  Future<Template?> getTodo(int id) async {
    List<Map> maps = await db!.query(tableAccount,
        columns: [columnId, columnTitle, columnDescription, columnDocumentation, columnBalance, columnColor, columnPathToIcon],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return Template.fromMap(maps.first as Map<String, Object?>);
    }
    return null;
  }

  Future<int> delete(int id) async {
    return await db!.delete(tableAccount, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<void> clearTable() async {
    return await db!.execute("DELETE FROM $tableAccount;");
  }

  Future<int> update(Template template) async {
    return await db!.update(tableAccount, template.toMap(),
        where: '$columnId = ?', whereArgs: [template.id]);
  }

  Future close() async => db!.close();

  bool isOpen(){ return db != null; }
}