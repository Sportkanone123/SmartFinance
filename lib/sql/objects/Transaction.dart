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

class Transaction {
  late int? id;
  late String title;
  late String type;
  late String merchant;
  late String status;
  late DateTime processDateTime;
  late String? message;
  late int? spendingGoalId;
  late double amount;
  late String pathToIcon;

  Transaction(this.id, this.title, this.type, this.merchant, this.status,
      this.processDateTime, this.message, this.spendingGoalId, this.amount,
      this.pathToIcon);

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      columnTitle: title,
      columnType: type,
      columnMerchant: merchant,
      columnStatus: status,
      columnProcessDateTime: processDateTime.toIso8601String(),
      columnSpendingGoalId: spendingGoalId,
      columnAmount: amount,
      columnPathToIcon: pathToIcon
    };

    if (id != null) {
      map[columnId] = id;
    }
    if (id != null) {
      map[columnMessage] = message;
    }

    return map;
  }

  Transaction.fromMap(Map<String, Object?> map) {
    id = map[columnId] as int;
    title = map[columnTitle] as String;
    type = map[columnType] as String;
    merchant = map[columnMerchant] as String;
    status = map[columnStatus] as String;
    processDateTime = DateTime.parse(map[columnProcessDateTime] as String);
    if(map[columnMessage] != null) {
      message = map[columnMessage] as String;
    }
    spendingGoalId = map[columnSpendingGoalId] as int;
    amount = map[columnAmount] as double;
    pathToIcon = map[columnPathToIcon] as String;
  }
}
