import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:money_expense/application/common/component/app_bar/i_app_bar.dart';
import 'package:money_expense/application/common/component/icon/i_icon_category.dart';
import 'package:money_expense/application/common/extension/context_extensions.dart';
import 'package:money_expense/core/extensions/num_extension.dart';
import 'package:money_expense/feature/after_login/home/model/history_transaction_model.dart';

import '../../../application/common/component/divider/i_divider.dart';
import '../../../application/common/component/slidable/i_slidable.dart';
import '../../../application/common/component/theme/i_colors.dart';
import 'detail_category_view_model.dart';

class DetailCategoryView extends StatelessWidget {
  static const routeName = "/DetailCategoryView";

  const DetailCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => DetailCategoryViewModel(context),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    return Consumer<DetailCategoryViewModel>(
      builder: (context, provider, child) {
        return Scaffold(
          key: provider.scaffoldKey,
          appBar: IAppBar.center(context, title: "Detail Kategori"),
          body: SingleChildScrollView(
            child: Column(
              children: [
                _headerBuild(context),
                IDivider.line(
                  thickness: 7,
                ),
                context.sbHeight(),
                _spendingListBuild(context),
                context.sbHeight(size: context.padding4)
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _headerBuild(BuildContext context) {
    return Consumer<DetailCategoryViewModel>(
      builder: (context, provider, child) {
        var data = provider.selectedItem;
        return Container(
          width: context.mQWidth(1),
          margin: EdgeInsets.all(context.padding2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                data?.categoryId ?? "-",
                style: context.bigTitle,
              ),
              context.sbHeight(),
              SizedBox(
                width: 90,
                child: IIconCategory.iconWithColorOutside(data?.category ?? ""),
              ),
              context.sbHeight(),
              Text(
                "Total Pengeluaran",
                style: context.paragraphRegular,
              ),
              Text(
                (data?.nominal ?? 0).toCurrency(symbol: "Rp. "),
                style: context.bigTitle,
              )
            ],
          ),
        );
      },
    );
  }

  Widget _spendingListBuild(BuildContext context) {
    return Consumer<DetailCategoryViewModel>(
      builder: (context, provider, child) {
        var data = provider.listItemHistory;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: context.padding2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pengeluaran",
                style: context.paragraphBold,
              ),
              context.sbHeight(),
              ListView.separated(
                  itemCount: data?.length ?? 0,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (BuildContext context, int index) =>
                      context.sbHeight(size: context.padding2),
                  itemBuilder: (context, index) {
                    var item = data?[index];
                    return ISlidable.primary(
                      onDelete: (context) {
                        provider.showPopUpConfirmation(provider.scaffoldKey.currentContext ?? context,
                            index: item?.index ?? 0);
                      },
                      onUpdate: (context) {
                        provider.goToEdit(context,
                            item: item ?? HistoryTransactionModel(index: item?.index ?? 0));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: context.padding2,
                          vertical: context.padding3,
                        ),
                        decoration: BoxDecoration(
                          color: Palette.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                                color: Palette.black.withOpacity(0.1),
                                offset: Offset.fromDirection(1, 3),
                                blurRadius: 5,
                                spreadRadius: 2),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 9,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IIconCategory.iconWithColorInside(item?.category ?? ""),
                                  context.sbWidth(),
                                  Expanded(
                                    child: Text(
                                      item?.name ?? "-",
                                      style: context.paragraphMedium?.copyWith(
                                        color: Palette.gray1,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                alignment: Alignment.centerRight,
                                child: Text(
                                  (item?.nominal ?? 0).toCurrency(symbol: "Rp. "),
                                  textAlign: TextAlign.end,
                                  style: context.paragraphSemiBold?.copyWith(
                                    color: Palette.gray1,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ],
          ),
        );
      },
    );
  }
}
