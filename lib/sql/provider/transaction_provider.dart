import 'package:sqflite/sqflite.dart' hide Transaction;

import '../objects/Transaction.dart';

const String tableAccount = 'accounts_database';
const String columnId = 'id';
const String columnTitle = 'title';
const String columnType = 'type';
const String columnMerchant = 'merchant';
const String columnStatus = 'status';
const String columnProcessDateTime = 'process_date_time';
const String columnMessage = 'message';
const String columnSpendingGoalId = 'spending_goal_id';
const String columnAmount = 'amount';
const String columnPathToIcon = 'path_to_icon';

class TransactionProvider {
  Database? db;

  Future open(String path) async {
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute('''
            create table $tableAccount (
            $columnId integer primary key autoincrement,
            $columnTitle text not null,
            $columnType text not null,
            $columnMerchant text not null,
            $columnStatus text not null,
            $columnProcessDateTime text not null,
            $columnMessage text,
            $columnSpendingGoalId int not null,
            $columnAmount real not null,
            $columnPathToIcon text not null );
          ''');
        });
  }

  Future<Transaction> insert(Transaction transaction) async {
    transaction.id = await db!.insert(tableAccount, transaction.toMap());
    return transaction;
  }

  Future<Transaction?> getTodo(int id) async {
    List<Map> maps = await db!.query(tableAccount,
        columns: [columnId, columnTitle, columnType, columnMerchant, columnStatus, columnProcessDateTime, columnMessage, columnSpendingGoalId, columnAmount, columnPathToIcon],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return Transaction.fromMap(maps.first as Map<String, Object?>);
    }
    return null;
  }

  Future<int> delete(int id) async {
    return await db!.delete(tableAccount, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<void> clearTable() async {
    return await db!.execute("DELETE FROM $tableAccount;");
  }

  Future<int> update(Transaction transaction) async {
    return await db!.update(tableAccount, transaction.toMap(),
        where: '$columnId = ?', whereArgs: [transaction.id]);
  }

  Future close() async => db!.close();

  bool isOpen(){ return db != null; }
}