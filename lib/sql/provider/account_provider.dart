import 'package:sqflite/sqflite.dart';

import '../objects/Account.dart';

const String tableAccount = 'accounts';
const String columnId = 'id';
const String columnTitle = 'title';
const String columnType = 'type';
const String columnAccountNumber = 'account_number';
const String columnBalance = 'balance';
const String columnSpendLimit = 'spend_limit';
const String columnPathToIcon = 'path_to_icon';
const String columnExpirationDate = 'expiration_date';
const String columnLastUsed = 'last_used';

class AccountProvider {
  Database? db;

  Future open(String path) async {
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute('''
            create table $tableAccount ( 
            $columnId integer primary key autoincrement, 
            $columnTitle text not null,
            $columnType text not null,
            $columnAccountNumber text not null,
            $columnBalance real not null,
            $columnSpendLimit real not null,
            $columnPathToIcon text not null,
            $columnExpirationDate text not null,
            $columnLastUsed text not null );
          ''');
        });
  }

  Future<Account> insert(Account account) async {
    account.id = await db!.insert(tableAccount, account.toMap());
    return account;
  }

  Future<Account?> getAccount(int id) async {
    List<Map> maps = await db!.query(tableAccount,
        columns: [columnId, columnTitle, columnType, columnAccountNumber, columnBalance, columnSpendLimit, columnPathToIcon, columnExpirationDate, columnLastUsed],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return Account.fromMap(maps.first as Map<String, Object?>);
    }
    return null;
  }

  Future<List<Account>> getAccounts() async {
    List<Map> maps = await db!.query(tableAccount,
      columns: [columnId, columnTitle, columnType, columnAccountNumber, columnBalance, columnSpendLimit, columnPathToIcon, columnExpirationDate, columnLastUsed],
    );

    List<Account> accounts = <Account>[];

    for(Map map in maps){
      accounts.add(Account.fromMap(map as Map<String, Object?>));
    }

    return accounts;
  }

  Future<int> delete(int id) async {
    return await db!.delete(tableAccount, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<void> clearTable() async {
    return await db!.execute("DELETE FROM $tableAccount;");
  }

  Future<int> update(Account account) async {
    return await db!.update(tableAccount, account.toMap(),
        where: '$columnId = ?', whereArgs: [account.id]);
  }

  Future close() async => db!.close();

  bool isOpen(){ return db != null; }
}