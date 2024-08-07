import 'package:hive/hive.dart';

part 't_history_money_expense.g.dart';

@HiveType(typeId: 1)
class TableHistoryMoneyExpense extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String category;

  @HiveField(2)
  DateTime date;

  @HiveField(3)
  num nominal;

  @HiveField(4)
  DateTime createAt = DateTime.now();

  TableHistoryMoneyExpense({
    required this.name,
    required this.category,
    required this.date,
    required this.nominal,
  });
}
