import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:smart_finance/sql/database_helper.dart';
import 'package:sqflite_sqlcipher/sqflite.dart' hide Transaction;

import '../../utils/secure_storage.dart';
import '../objects/Transaction.dart';

const String tableAccount = 'accounts';
const String columnBalance = 'balance';
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
    db = await openDatabase(path, version: 1, password: await SecureStorage.read("transactions_pswd"),
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
    DatabaseHelper.getAccountProvider().then((value) => value.modifyBalance(transaction, transaction.amount));
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
        limit: limit,
        orderBy: "$columnProcessDateTime DESC"
    );

    List<Transaction> transactions = <Transaction>[];

    for(Map map in maps){
      transactions.add(Transaction.fromMap(map as Map<String, Object?>));
    }

    return transactions;
  }

  Future<List<Transaction>> getTransactionsByKeyword(String keyword) async {
    keyword.replaceAll(" ", "%");
    keyword = "%$keyword%";

    List<Map> maps = await db!.query(tableTransaction,
        columns: [columnId, columnAccountId, columnTitle, columnMerchant, columnStatus, columnProcessDateTime, columnType, columnMessage, columnSpendingGoalId, columnAmount, columnPathToIcon],
        where: '$columnTitle LIKE ? OR $columnMerchant LIKE ? OR $columnType LIKE ? OR $columnMessage LIKE ? OR $columnAmount LIKE ?',
        whereArgs: [keyword, keyword, keyword, keyword, keyword],
        orderBy: "$columnProcessDateTime DESC"
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

  Future<int> delete(Transaction transaction) async {
    DatabaseHelper.getAccountProvider().then((value) => value.modifyBalance(transaction, transaction.amount * (-1)));
    return await db!.delete(tableTransaction, where: '$columnId = ?', whereArgs: [transaction.id]);
  }

  Future<void> clearTable() async {
    return await db!.execute("DELETE FROM $tableTransaction;");
  }

  Future<int> update(Transaction transaction, double amountDifference) async {
    DatabaseHelper.getAccountProvider().then((value) => value.modifyBalance(transaction, amountDifference));
    return await db!.update(tableTransaction, transaction.toMap(),
        where: '$columnId = ?', whereArgs: [transaction.id]);
  }

  Future close() async => db!.close();

  bool isOpen(){ return db != null; }
}