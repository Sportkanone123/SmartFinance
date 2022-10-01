import 'package:sqflite/sqflite.dart' hide Transaction;

import '../objects/Transaction.dart';

const String tableTransaction = 'transactions';
const String columnId = 'id';
const String columnAccountId = 'account_id';
const String columnTitle = 'title';
const String columnMerchant = 'merchant';
const String columnStatus = 'status';
const String columnProcessDateTime = 'process_date_time';
const String columnType = 'type';
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
            create table $tableTransaction (
            $columnId integer primary key autoincrement,
            $columnAccountId integer not null,
            $columnTitle text not null,
            $columnMerchant text not null,
            $columnStatus text not null,
            $columnProcessDateTime text not null,
            $columnType text not null,
            $columnMessage text,
            $columnSpendingGoalId integer,
            $columnAmount real not null,
            $columnPathToIcon text not null );
          ''');
        });
  }

  Future<Transaction> insert(Transaction transaction) async {
    transaction.id = await db!.insert(tableTransaction, transaction.toMap());
    return transaction;
  }

  Future<Transaction?> getTransaction(int id) async {
    List<Map> maps = await db!.query(tableTransaction,
        columns: [columnId, columnAccountId, columnTitle, columnMerchant, columnStatus, columnProcessDateTime, columnType, columnMessage, columnSpendingGoalId, columnAmount, columnPathToIcon],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return Transaction.fromMap(maps.first as Map<String, Object?>);
    }
    return null;
  }

  Future<List<Transaction>> getTransactions(int limit) async {
    List<Map> maps = await db!.query(tableTransaction,
        columns: [columnId, columnAccountId, columnTitle, columnMerchant, columnStatus, columnProcessDateTime, columnType, columnMessage, columnSpendingGoalId, columnAmount, columnPathToIcon],
        limit: limit
    );

    List<Transaction> transactions = <Transaction>[];

    for(Map map in maps){
      transactions.add(Transaction.fromMap(map as Map<String, Object?>));
    }

    return transactions;
  }

  Future<List<Transaction>> getTransactionsByAccountID(int account, int limit) async {
    List<Map> maps = await db!.query(tableTransaction,
      columns: [columnId, columnAccountId, columnTitle, columnMerchant, columnStatus, columnProcessDateTime, columnType, columnMessage, columnSpendingGoalId, columnAmount, columnPathToIcon],
      where: '$columnAccountId = ?',
      whereArgs: [account],
      limit: limit,
      orderBy: "$columnProcessDateTime DESC"
    );

    List<Transaction> transactions = <Transaction>[];

    for(Map map in maps){
      transactions.add(Transaction.fromMap(map as Map<String, Object?>));
    }

    return transactions;
  }

  Future<int> delete(int id) async {
    return await db!.delete(tableTransaction, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<void> clearTable() async {
    return await db!.execute("DELETE FROM $tableTransaction;");
  }

  Future<int> update(Transaction transaction) async {
    return await db!.update(tableTransaction, transaction.toMap(),
        where: '$columnId = ?', whereArgs: [transaction.id]);
  }

  Future close() async => db!.close();

  bool isOpen(){ return db != null; }
}