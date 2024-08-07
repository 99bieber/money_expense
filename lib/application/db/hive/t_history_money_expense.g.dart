// GENERATED CODE - DO NOT MODIFY BY HAND

part of 't_history_money_expense.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TableHistoryMoneyExpenseAdapter
    extends TypeAdapter<TableHistoryMoneyExpense> {
  @override
  final int typeId = 1;

  @override
  TableHistoryMoneyExpense read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TableHistoryMoneyExpense(
      name: fields[0] as String,
      category: fields[1] as String,
      date: fields[2] as DateTime,
      nominal: fields[3] as num,
    )..createAt = fields[4] as DateTime;
  }

  @override
  void write(BinaryWriter writer, TableHistoryMoneyExpense obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.category)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.nominal)
      ..writeByte(4)
      ..write(obj.createAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TableHistoryMoneyExpenseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
