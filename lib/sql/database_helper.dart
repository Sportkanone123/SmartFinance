import 'package:smart_finance/sql/provider/account_provider.dart';
import 'package:smart_finance/sql/provider/goal_provider.dart';
import 'package:smart_finance/sql/provider/template_provider.dart';
import 'package:smart_finance/sql/provider/transaction_provider.dart';

class DatabaseHelper {
  final AccountProvider _accountsProvider = AccountProvider();
  final GoalProvider _goalsProvider = GoalProvider();
  final TemplateProvider _templatesProvider = TemplateProvider();
  final TransactionProvider _transactionsProvider = TransactionProvider();

  DatabaseHelper();

  Future<AccountProvider> getAccountProvider() async {
    if(_accountsProvider.isOpen()){
      return _accountsProvider;
    }else{
      await _accountsProvider.open('accounts.db');
      return _accountsProvider;
    }
  }

  Future<GoalProvider> getGoalsProvider() async {
    if(_goalsProvider.isOpen()){
      return _goalsProvider;
    }else{
      await _goalsProvider.open('goals.db');
      return _goalsProvider;
    }
  }

  Future<TemplateProvider> getTemplatesProvider() async {
    if(_templatesProvider.isOpen()){
      return _templatesProvider;
    }else{
      await _templatesProvider.open('templates.db');
      return _templatesProvider;
    }
  }

  Future<TransactionProvider> getTransactionsProvider() async {
    if(_transactionsProvider.isOpen()){
      return _transactionsProvider;
    }else{
      await _transactionsProvider.open('transactions.db');
      return _transactionsProvider;
    }
  }
}