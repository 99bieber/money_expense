import 'package:flutter/material.dart';
import 'package:money_expense/application/common/extension/context_extensions.dart';
import 'package:money_expense/core/extensions/string_extension.dart';

import '../../../application/common/component/button/i_button.dart';
import '../../../application/common/component/theme/i_colors.dart';
import '../../../application/service/hive_service.dart';
import '../../../route/base_route/route.dart';
import '../add_new_entry/add_new_entry_view.dart';
import '../home/model/history_transaction_model.dart';
import '../home/model/spending_category_nodel.dart';

class DetailCategoryViewModel extends ChangeNotifier {
  DetailCategoryViewModel(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initPage(context);
    });
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final HiveService hiveService = HiveService();
  SpendingCategoryModel? selectedItem;
  List<HistoryTransactionModel>? listItemHistory;

  Future<void> initPage(BuildContext context) async {
    await _getArgument(context);
  }

  Future<void> _getArgument(BuildContext context) async {
    final argument = context.argumentsMap;
    if (argument?['item'] is SpendingCategoryModel) {
      selectedItem = argument?['item'] as SpendingCategoryModel;
    }

    if (argument?['listAll'] is List<HistoryTransactionModel>) {
      var listALl = argument?['listAll'] as List<HistoryTransactionModel>;
      listItemHistory = listALl
          .where(
            (element) => element.category?.toLowerCase() == selectedItem?.category?.toLowerCase(),
          )
          .toList();
    }
    notifyListeners();
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

  Future<void> deleteData(
    BuildContext context, {
    required int index,
  }) async {
    hiveService.deleteHive(index);
    if (listItemHistory?.length == 1) {
      Navigator.pop(context);
      return;
    }
    await _loadDataNew(context);
  }

  Future<void> goToEdit(
    BuildContext context, {
    required HistoryTransactionModel item,
  }) async {
    await goToNamed(context, routeName: AddNewEntryView.routeName, arguments: {
      "item": item,
    }).then(
      (value) {
        _loadDataNew(context);
      },
    );
  }

  Future<void> _loadDataNew(BuildContext context) async {
    final data = await hiveService.getAll();
    List<HistoryTransactionModel> listHistory = [];
    data.map((e) {
      listHistory.add(HistoryTransactionModel(
          index: data.indexOf(e),
          name: e.name,
          category: e.category,
          date: e.date,
          nominal: e.nominal,
          createAt: e.createAt));
    }).toList();
    _spendingCategory(
      listHistory: listHistory,
    );
  }

  Future<void> _spendingCategory({
    required List<HistoryTransactionModel> listHistory,
  }) async {
    Map<String, num> tempResult = {};

    for (var item in listHistory) {
      String category = item.category ?? "";
      num nominal = item.nominal ?? 0;
      if (tempResult.containsKey(category)) {
        tempResult[category] = tempResult[category]! + nominal;
      } else {
        tempResult[category] = nominal;
      }
    }

    List<SpendingCategoryModel> listSpending = [];

    tempResult.entries.map((entry) {
      return listSpending.add(SpendingCategoryModel(
          category: entry.key, nominal: entry.value, categoryId: entry.key.categoryId()));
    }).toList();

    var selectedItemRaw = selectedItem;

    selectedItem = listSpending.firstWhere(
      (element) => element.category?.toLowerCase() == selectedItemRaw?.category?.toLowerCase(),
    );

    listItemHistory?.clear();
    listItemHistory = listHistory
        .where((element) => element.category?.toLowerCase() == selectedItem?.category?.toLowerCase())
        .toList();
    listItemHistory?.sort((a, b) => b.index.compareTo(a.index));

    notifyListeners();
  }
}
