import 'package:hive_flutter/hive_flutter.dart';

import '../db/hive/t_history_money_expense.dart';

class HiveService {
  final String  _boxName = "HistoryMoneyExpense";

  Future<Box<TableHistoryMoneyExpense>> get _box async =>
      await Hive.openBox<TableHistoryMoneyExpense>(_boxName);

//create
  Future<void> addHive(TableHistoryMoneyExpense tableHistoryMoneyExpense) async {
    var box = await _box;
    await box.add(tableHistoryMoneyExpense);
  }

//read
  Future<List<TableHistoryMoneyExpense>> getAll() async {
    var box = await _box;
    return box.values.toList();
  }

//update
  Future<void> updateHive(int index, TableHistoryMoneyExpense tableHistoryMoneyExpense) async {
    var box = await _box;
    await box.putAt(index, tableHistoryMoneyExpense);
  }

//delete
  Future<void> deleteHive(int index) async {
    var box = await _box;
    await box.deleteAt(index);
  }
}