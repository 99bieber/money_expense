
import 'package:flutter/material.dart';
import 'package:money_expense/application/common/extension/context_extensions.dart';
import 'package:money_expense/application/common/extension/date_time_extensions.dart';
import 'package:money_expense/core/extensions/num_extension.dart';
import 'package:money_expense/core/extensions/string_extension.dart';

import '../../../application/common/component/button/i_button.dart';
import '../../../application/common/component/theme/i_colors.dart';
import '../../../application/db/hive/t_history_money_expense.dart';
import '../../../application/service/hive_service.dart';
import '../home/model/history_transaction_model.dart';
import 'model/category_model.dart';

class AddNewEntryViewModel extends ChangeNotifier {
  AddNewEntryViewModel(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initPage(context);
    });
  }

  TextEditingController spendingNameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController nominalController = TextEditingController();

  List<CategoryModel> listCategory = [];
  CategoryModel? selectedCategory;
  DateTime? selectedDateTime;

  HistoryTransactionModel? editedData;

  final HiveService hiveService = HiveService();

  bool get isButtonActive =>
      spendingNameController.text.isNotEmpty &&
      categoryController.text.isNotEmpty &&
      dateController.text.isNotEmpty &&
      nominalController.text.isNotEmpty &&
      selectedCategory != null;

  Future<void> initPage(BuildContext context) async {
    await _getListCategory();
    if (context.mounted) {
      _getArgument(context);
    }
  }

  void _getArgument(BuildContext context) {
    final argument = context.argumentsMap;
    if (argument?['item'] is HistoryTransactionModel) {
      editedData = argument?['item'] as HistoryTransactionModel;
      spendingNameController.text = editedData?.name ?? "";
      selectedCategory = listCategory.firstWhere(
        (element) => (element.category ?? "").toLowerCase() == editedData?.category?.toLowerCase(),
        orElse: () => CategoryModel(),
      );
      categoryController.text = selectedCategory?.name ?? "";
      nominalController.text = (editedData?.nominal).toCurrency();
      selectedDateTime = editedData?.date;
      dateController.text = selectedDateTime?.iEEEDDMMMYYYY ?? "";
    }
    notifyListeners();
  }

  Future<void> _getListCategory() async {
    listCategory = [
      CategoryModel(name: 'Makanan', category: 'Food'),
      CategoryModel(name: 'Pendidikan', category: 'Education'),
      CategoryModel(name: 'Hiburan', category: 'Entertainment'),
      CategoryModel(name: 'Hadiah', category: 'Gift'),
      CategoryModel(name: 'Alat Rumah', category: 'HomeTools'),
      CategoryModel(name: 'Internet', category: 'Internet'),
      CategoryModel(name: 'Belanja', category: 'Shopping'),
      CategoryModel(name: 'Olahraga', category: 'Sport'),
      CategoryModel(name: 'Transport', category: 'Transport'),
    ];
    listCategory.sort((a, b) => (a.name ?? "").toLowerCase().compareTo((b.name ?? "").toLowerCase()));
    notifyListeners();
  }

  void selectCategory(
    BuildContext context, {
    required CategoryModel item,
  }) {
    selectedCategory = item;
    categoryController.text = item.name ?? "-";
    notifyListeners();
    Navigator.pop(context);
  }

  void update() {
    notifyListeners();
  }

  void selectDate(
    BuildContext context, {
    DateTime? dateTime,
  }) {
    selectedDateTime = dateTime;
    dateController.text = dateTime?.iEEEDDMMMYYYY ?? "";
    notifyListeners();
  }

  void showPopUpConfirmation(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
    context.showDialogWarningSimple(
      description: editedData != null
          ? "Apakah anda yakin akan mengubah pengeluaran ini?"
          : "Apakah anda yakin akan menyimpan pengeluaran baru ini?",
      actions: [
        Center(
          child: Row(
            children: [
              Expanded(
                child: IButton.primary(
                  onPressed: () {
                    Navigator.pop(context, true);
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
                    Navigator.pop(context, false);
                  },
                ),
              )
            ],
          ),
        )
      ],
    ).then((value) {
      if (value == true) {
        if (editedData != null) {
          updateData(context);
          return;
        }
        _saveToDb(context);
      }
    });
  }

  void _saveToDb(BuildContext context) {
    try {
      hiveService.addHive(
        TableHistoryMoneyExpense(
          name: spendingNameController.text,
          category: selectedCategory?.category ?? "-",
          date: selectedDateTime ?? DateTime.now(),
          nominal: nominalController.text.currencyToInt(),
        ),
      );
      context.toastSimple(
        context,
        label: "Anda Berhasil Menyimpan Data",
        backgroundColor: Palette.green2,
        primaryColor: Palette.green2,
      );
      clearAllData();
    } catch (_) {
      context.toastSimple(
        context,
        label: "Gagal Menyimpan Data",
        backgroundColor: Palette.red,
        primaryColor: Palette.red,
      );
    }
  }

  void clearAllData() {
    selectedDateTime = null;
    selectedCategory = null;
    spendingNameController.clear();
    categoryController.clear();
    dateController.clear();
    nominalController.clear();
    notifyListeners();
  }

  void updateData(BuildContext context) {
    try {
      hiveService.updateHive(
          editedData?.index ?? 0,
          TableHistoryMoneyExpense(
            name: spendingNameController.text,
            category: selectedCategory?.category ?? "",
            date: selectedDateTime ?? DateTime.now(),
            nominal: nominalController.text.currencyToInt(),
          ));
      context.toastSimple(
        context,
        label: "Anda Berhasil Menyimpan Data",
        backgroundColor: Palette.green2,
        primaryColor: Palette.green2,
      );
    } catch (_) {
      context.toastSimple(
        context,
        label: "Gagal Menyimpan Data",
        backgroundColor: Palette.red,
        primaryColor: Palette.red,
      );
    }
  }
}
