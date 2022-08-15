const String tableAccount = 'accounts_database';
const String columnId = 'id';
const String columnTitle = 'title';
const String columnType = 'type';
const String columnAccountNumber = 'account_number';
const String columnBalance = 'balance';
const String columnSpendLimit = 'spend_limit';
const String columnPathToIcon = 'path_to_icon';
const String columnExpirationDate = 'expiration_date';
const String columnLastUsed = 'last_used';

class Account {
  late int? id;
  late String title;
  late String type;
  late String accountNumber;
  late double balance;
  late double spendLimit;
  late String pathToIcon;
  late DateTime expirationDate;
  late DateTime lastUsed;


  Account(this.id, this.title, this.type, this.accountNumber, this.balance,
      this.spendLimit, this.pathToIcon, this.expirationDate, this.lastUsed);

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      columnTitle: title,
      columnType: type,
      columnAccountNumber: accountNumber,
      columnBalance: balance,
      columnSpendLimit: spendLimit,
      columnPathToIcon: pathToIcon,
      columnExpirationDate: expirationDate.toIso8601String(),
      columnLastUsed: lastUsed.toIso8601String(),
    };

    if (id != null) {
      map[columnId] = id;
    }

    return map;
  }

  Account.fromMap(Map<String, Object?> map) {
    id = map[columnId] as int;
    title = map[columnTitle] as String;
    type = map[columnType] as String;
    accountNumber = map[columnAccountNumber] as String;
    balance = map[columnBalance] as double;
    spendLimit = map[columnSpendLimit] as double;
    pathToIcon = map[columnPathToIcon] as String;
    expirationDate = DateTime.parse(map[columnExpirationDate] as String);
    lastUsed = DateTime.parse(map[columnLastUsed] as String);
  }
}
