import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:money_expense/application/common/extension/context_extensions.dart';
import 'package:money_expense/core/extensions/string_extension.dart';
import 'package:money_expense/feature/after_login/detail_category/detail_category_view.dart';

import '../../../application/common/component/button/i_button.dart';
import '../../../application/common/component/theme/i_colors.dart';
import '../../../application/db/hive/t_history_money_expense.dart';
import '../../../application/service/hive_service.dart';
import '../../../route/base_route/route.dart';
import '../add_new_entry/add_new_entry_view.dart';
import 'model/history_transaction_model.dart';
import 'model/spending_category_nodel.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initPage(context);
    });
  }

  final HiveService hiveService = HiveService();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  List<HistoryTransactionModel> listHistoryToday = [];
  List<HistoryTransactionModel> listHistoryYesterday = [];
  List<SpendingCategoryModel> listSpending = [];

  num spendingToday = 0;
  num spendingMonthly = 0;

  Future<void> initPage(BuildContext context) async {
    await Hive.openBox<TableHistoryMoneyExpense>('HistoryMoneyExpense');
    await _getListHistory();
    _spendingCategory();
    _calculationSpending();
    _sortingList();
  }

  Future<void> _getListHistory() async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    listHistoryToday.clear();
    listHistoryYesterday.clear();
    final data = await hiveService.getAll();
    data.map((e) {
      final dateDB = DateTime(e.date.year, e.date.month, e.date.day);
      if (dateDB == today) {
        listHistoryToday.add(HistoryTransactionModel(
            index: data.indexOf(e),
            name: e.name,
            category: e.category,
            date: e.date,
            nominal: e.nominal,
            createAt: e.createAt));
      } else {
        listHistoryYesterday.add(HistoryTransactionModel(
            index: data.indexOf(e),
            name: e.name,
            category: e.category,
            date: e.date,
            nominal: e.nominal,
            createAt: e.createAt));
      }
    }).toList();
  }

  Future<void> _spendingCategory() async {
    var listAll = [...listHistoryToday, ...listHistoryYesterday];

    Map<String, num> tempResult = {};

    for (var item in listAll) {
      String category = item.category ?? "";
      num nominal = item.nominal ?? 0;
      if (tempResult.containsKey(category)) {
        tempResult[category] = tempResult[category]! + nominal;
      } else {
        tempResult[category] = nominal;
      }
    }

    listSpending.clear();

    tempResult.entries.map((entry) {
      return listSpending.add(SpendingCategoryModel(
          category: entry.key, nominal: entry.value, categoryId: entry.key.categoryId()));
    }).toList();

    notifyListeners();
  }

  void _calculationSpending() {
    var listAll = [...listHistoryToday, ...listHistoryYesterday];

    DateTime today = DateTime.now();
    DateTime startOfMonth = DateTime(today.year, today.month, 1);

    spendingToday = listAll
        .where((item) => isSameDay(item.date ?? DateTime.now(), today))
        .fold(0, (sum, item) => sum + (item.nominal ?? 0));

    spendingMonthly = listAll
        .where((item) =>
            (item.date?.isAfter(startOfMonth) ?? false) ||
            isSameDay(item.date ?? DateTime.now(), startOfMonth))
        .fold(0, (sum, item) => sum + (item.nominal ?? 0));
    notifyListeners();
  }

  void _sortingList() {
    listHistoryToday.sort((a, b) => (b.index).compareTo(a.index));
    listHistoryYesterday.sort((a, b) => (b.index).compareTo(a.index));
    listSpending.sort((a, b) => (a.categoryId ?? "").compareTo(b.categoryId ?? ""));
    notifyListeners();
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year && date1.month == date2.month && date1.day == date2.day;
  }

  void deleteData(
    BuildContext context, {
    required int index,
  }) {
    hiveService.deleteHive(index);
    initPage(context);
  }

  Future<void> showPopUpConfirmation(
    BuildContext context, {
    required int index,
  }) async {
    context.showDialogWarningSimple(
      description: "Apakah anda yakin akan menghapus pengeluaran ini?",
      actions: [
        Center(
          child: Row(
            children: [
              Expanded(
                child: IButton.primary(
                  onPressed: () {
                    deleteData(context, index: index);
                    Navigator.pop(context);
                  },
                  title: "Iya",
                ),
              ),
              context.sbWidth(size: context.padding2),
              Expanded(
                child: IButton.primary(
                  title: "Tidak",
                  color: Palette.red,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Future<void> goToAddNewEntry(BuildContext context) async {
    await goToNamed(
      context,
      routeName: AddNewEntryView.routeName,
    ).then(
      (value) => initPage(context),
    );
  }

  Future<void> goToEdit(
    BuildContext context, {
    required HistoryTransactionModel item,
  }) async {
    await goToNamed(context, routeName: AddNewEntryView.routeName, arguments: {
      "item": item,
    }).then(
      (value) => initPage(context),
    );
  }

  Future<void> goToDetailCategory(
    BuildContext context, {
    required SpendingCategoryModel item,
  }) async {
    var listAll = [...listHistoryToday, ...listHistoryYesterday];
    await goToNamed(context, routeName: DetailCategoryView.routeName, arguments: {
      "item": item,
      "listAll": listAll,
    }).then(
      (value) => initPage(context),
    );
  }

  void showPopUpExit(BuildContext context) {
    context.showDialogWarningSimple(
      description: "Anda mau keluar dari aplikasi?",
      actions: [
        Center(
          child: Row(
            children: [
              Expanded(
                child: IButton.primary(
                  onPressed: () {
                    exit(1);
                  },
                  title: "Iya",
                ),
              ),
              context.sbWidth(size: context.padding2),
              Expanded(
                child: IButton.primary(
                  title: "Tidak",
                  color: Palette.red,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
