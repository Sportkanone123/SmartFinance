import 'package:smart_finance/sql/provider/account_provider.dart';
import 'package:smart_finance/sql/provider/goal_provider.dart';
import 'package:smart_finance/sql/provider/template_provider.dart';
import 'package:smart_finance/sql/provider/transaction_provider.dart';

class DatabaseHelper {
  static final AccountProvider _accountsProvider = AccountProvider();
  static final GoalProvider _goalsProvider = GoalProvider();
  static final TemplateProvider _templatesProvider = TemplateProvider();
  static final TransactionProvider _transactionsProvider = TransactionProvider();

  DatabaseHelper();

  static Future<AccountProvider> getAccountProvider() async {
    if(_accountsProvider.isOpen()){
      return _accountsProvider;
    }else{
      await _accountsProvider.open('accounts.db');
      return _accountsProvider;
    }
  }

  static Future<GoalProvider> getGoalsProvider() async {
    if(_goalsProvider.isOpen()){
      return _goalsProvider;
    }else{
      await _goalsProvider.open('goals.db');
      return _goalsProvider;
    }
  }

  static Future<TemplateProvider> getTemplatesProvider() async {
    if(_templatesProvider.isOpen()){
      return _templatesProvider;
    }else{
      await _templatesProvider.open('templates.db');
      return _templatesProvider;
    }
  }

  static Future<TransactionProvider> getTransactionsProvider() async {
    if(_transactionsProvider.isOpen()){
      return _transactionsProvider;
    }else{
      await _transactionsProvider.open('transactions.db');
      return _transactionsProvider;
    }
  }
}