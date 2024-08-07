import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:money_expense/application/common/extension/context_extensions.dart';

import '../../../application/common/component/app_bar/i_app_bar.dart';
import '../../../application/common/component/button/i_button.dart';
import '../../../application/common/component/gridview/i_dynamic_grid_view.dart';
import '../../../application/common/component/icon/i_icon_category.dart';
import '../../../application/common/component/textfield/i_text_field.dart';
import '../../../application/common/component/theme/i_colors.dart';
import 'add_new_entry_view_model.dart';

class AddNewEntryView extends StatelessWidget {
  static const routeName = "/AddNewEntryView";

  const AddNewEntryView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => AddNewEntryViewModel(context),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    return Consumer<AddNewEntryViewModel>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: IAppBar.center(
            context,
            title: provider.editedData != null ? "Ubah Pengeluaran" : "Tambah Pengeluaran Baru",
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(context.padding2),
            child: Column(
              children: [
                _inputNameOfExpenditureBuild(context),
                context.sbHeight(
                  size: context.padding1,
                ),
                _inputChooseCategoryBuild(context),
                context.sbHeight(
                  size: context.padding1,
                ),
                _inputDateBuild(context),
                context.sbHeight(
                  size: context.padding1,
                ),
                _inputNominalBuild(context),
                context.sbHeight(),
                _buttonSaveBuild(context),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _inputNameOfExpenditureBuild(BuildContext context) {
    return Consumer<AddNewEntryViewModel>(
      builder: (context, provider, child) {
        return ITextField.primary(
          label: "",
          hintText: "Nama Pengeluaran",
          controller: provider.spendingNameController,
          onChanged: (val) {
            provider.update();
          },
        );
      },
    );
  }

  Widget _inputChooseCategoryBuild(BuildContext context) {
    return Consumer<AddNewEntryViewModel>(
      builder: (context, provider, child) {
        return ITextField.primary(
          label: "",
          readOnly: true,
          hintText: "Pilih Category",
          prefixIcon: provider.selectedCategory != null
              ? Padding(
            padding: EdgeInsets.all(context.padding1 + 4),
            child: IIconCategory.iconWithColorInside(
              provider.selectedCategory?.category ?? "-",
            ),
          )
              : null,
          suffixIcon: Padding(
            padding: EdgeInsets.all(context.padding1 + 2),
            child: const ClipOval(
              child: Material(
                color: Palette.gray5,
                child: Icon(
                  Icons.keyboard_arrow_right,
                  size: 20,
                  color: Palette.gray3,
                ),
              ),
            ),
          ),
          controller: provider.categoryController,
          onTap: () {
            _showBottomSheetCategoryBuild(context, provider: provider);
            // print("TAP");
          },
        );
      },
    );
  }

  Widget _inputDateBuild(BuildContext context) {
    return Consumer<AddNewEntryViewModel>(
      builder: (context, provider, child) {
        return ITextField.dateTime(
          context,
          label: "",
          hinText: "Tanggal Pengeluaran",
          readOnly: true,
          controller: provider.dateController,
          onSubmitted: (DateTime? dateTime) {
            provider.selectDate(context, dateTime: dateTime);
          },
        );
      },
    );
  }

  Widget _inputNominalBuild(BuildContext context) {
    return Consumer<AddNewEntryViewModel>(
      builder: (context, provider, child) {
        return ITextField.currency(
          hintText: "Nominal",
          label: "",
          symbolMataUang: "Rp. ",
          controller: provider.nominalController,
          onChanged: (val) {
            provider.update();
          },
        );
      },
    );
  }

  Widget _buttonSaveBuild(BuildContext context) {
    return Consumer<AddNewEntryViewModel>(
      builder: (context, provider, child) {
        return IButton.primary(
          onPressed: provider.isButtonActive ? () {
            provider.showPopUpConfirmation(context);
          } : null,
          title: "Simpan",
        );
      },
    );
  }

  Future _showBottomSheetCategoryBuild(BuildContext context, {
    required AddNewEntryViewModel provider,
  }) {
    var data = provider.listCategory;
    return showModalBottomSheet(
        isScrollControlled: true,
        useSafeArea: true,
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.all(context.padding4),
            width: context.mQWidth(1),
            child: Wrap(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Pilih Kategori",
                      style: context.paragraphMedium?.copyWith(
                        color: Palette.gray2,
                      ),
                    ),
                    const Icon(
                      Icons.close_rounded,
                      size: 18,
                      color: Palette.black,
                    ),
                  ],
                ),
                IDynamicHeightGridView(
                  padding: EdgeInsets.only(top: context.padding4),
                  itemCount: data.length,
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  mainAxisSpacing: 32,
                  crossAxisSpacing: 32,
                  physics: const NeverScrollableScrollPhysics(),
                  builder: (BuildContext context, int index) {
                    var item = data[index];
                    return InkWell(
                      onTap: () {
                        provider.selectCategory(
                          context,
                          item: item,
                        );
                      },
                      child: Column(
                        children: [
                          IIconCategory.iconWithColorOutside(item.category ?? ""),
                          context.sbHeight(size: context.padding0),
                          Text(
                            item.name ?? "-",
                            style: context.captionMedium,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        });
  }
}
