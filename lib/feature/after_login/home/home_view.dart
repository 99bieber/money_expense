import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:money_expense/application/common/component/slidable/i_slidable.dart';
import 'package:money_expense/application/common/extension/context_extensions.dart';
import 'package:money_expense/application/common/extension/num_extensions.dart';

import '../../../application/common/component/icon/i_icon_category.dart';
import '../../../application/common/component/theme/i_colors.dart';
import 'home_view_mode.dart';

class HomeView extends StatelessWidget {
  static const routeName = "/HomeView";

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => HomeViewModel(context),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, provider, child) {
        return Scaffold(
          key: provider.scaffoldKey,
          floatingActionButton: FloatingActionButton(
            shape: const CircleBorder(),
            backgroundColor: Palette.primary,
            splashColor: Palette.secondary,
            tooltip: 'Tambah',
            onPressed: () {
              provider.goToAddNewEntry(context);
            },
            child: const Icon(
              Icons.add,
              color: Palette.white,
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  context.sbHeight(),
                  _headerBuild(context),
                  context.sbHeight(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: context.padding2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _todayExpensesBuild(context),
                        context.sbWidth(),
                        _monthlyExpensesBuild(context),
                      ],
                    ),
                  ),
                  context.sbHeight(),
                  if (provider.listHistoryToday.isEmpty &&
                      provider.listHistoryYesterday.isEmpty &&
                      provider.listSpending.isEmpty) ...[
                    Center(
                      child: SizedBox(
                        width: context.mQWidth(0.7),
                        height: context.mQHeight(0.5),
                        child: Center(
                          child: Text(
                            'Belum Ada Pencatatan Pengeluaran. Klik tombol "+" untuk menambahkan pengeluaran hari ini.',
                            style: context.paragraphSemiBold,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ] else ...[
                    _expensesByCategoryBuild(context),
                    context.sbHeight(),
                    if (provider.listHistoryToday.isNotEmpty) ...[
                      _todayMoneyExpenseBuild(context),
                      context.sbHeight(),
                    ],
                    if (provider.listHistoryYesterday.isNotEmpty) _yesterdayMoneyExpenseBuild(context),
                    context.sbHeight(size: context.padding10),
                  ]
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _headerBuild(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.padding2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Halo, User!",
            style: context.bigTitle,
          ),
          Text(
            "Jangan lupa catat keuanganmu setiap hari!",
            style: context.paragraphMedium,
          ),
        ],
      ),
    );
  }

  Widget _todayExpensesBuild(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, provider, child) {
        return PopScope(
          canPop: false,
          onPopInvoked: (val) async {
            provider.showPopUpExit(context);
          },
          child: Expanded(
            child: Container(
              height: 97,
              padding: EdgeInsets.all(context.padding1),
              decoration: BoxDecoration(
                color: Palette.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "Pengeluaranmu hari ini",
                      style: context.paragraphSemiBold?.copyWith(
                        color: Palette.white,
                      ),
                    ),
                  ),
                  context.sbHeight(),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      provider.spendingToday.toCurrency(symbol: "Rp. "),
                      style: context.bigTitle?.copyWith(
                        color: Palette.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _monthlyExpensesBuild(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, provider, child) {
        return Expanded(
          child: Container(
            height: 97,
            padding: EdgeInsets.all(context.padding1),
            decoration: BoxDecoration(
              color: Palette.secondary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    "Pengeluaranmu bulan ini",
                    style: context.paragraphSemiBold?.copyWith(
                      color: Palette.white,
                    ),
                  ),
                ),
                context.sbHeight(),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    provider.spendingMonthly.toCurrency(symbol: "Rp. "),
                    style: context.bigTitle?.copyWith(
                      color: Palette.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _expensesByCategoryBuild(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, provider, child) {
        var index = 0;
        var data = provider.listSpending;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: context.padding2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pengeluaran berdasarkan kategori",
                style: context.paragraphBold,
              ),
              context.sbHeight(),
              SingleChildScrollView(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: data.map((item) {
                      index++;
                      return Row(
                        children: [
                          InkWell(
                            onTap: () {
                              provider.goToDetailCategory(context, item: item);
                            },
                            child: Container(
                              width: 120,
                              // margin: EdgeInsets.symmetric(vertical: context.padding2),
                              padding: EdgeInsets.all(context.padding2),
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  IIconCategory.iconWithColorOutside(item.category ?? "-"),
                                  context.sbHeight(
                                    size: context.padding1,
                                  ),
                                  Text(
                                    item.categoryId ?? "-",
                                    style: context.captionMedium,
                                  ),
                                  context.sbHeight(
                                    size: context.padding0,
                                  ),
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      item.nominal.toCurrency(symbol: "Rp. "),
                                      style: context.captionBold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (index != data.length) context.sbWidth(),
                        ],
                      );
                    }).toList(),
                  )),
            ],
          ),
        );
      },
    );
  }

  Widget _todayMoneyExpenseBuild(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, provider, child) {
        var data = provider.listHistoryToday;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: context.padding2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hari ini",
                style: context.paragraphBold,
              ),
              context.sbHeight(),
              ListView.separated(
                  itemCount: data.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (BuildContext context, int index) =>
                      context.sbHeight(size: context.padding2),
                  itemBuilder: (context, index) {
                    var item = data[index];
                    return ISlidable.primary(
                      onDelete: (context) {
                        provider.showPopUpConfirmation(provider.scaffoldKey.currentContext ?? context,
                            index: item.index);
                      },
                      onUpdate: (context) {
                        provider.goToEdit(context, item: item);
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
                                  IIconCategory.iconWithColorInside(item.category ?? ""),
                                  context.sbWidth(),
                                  Expanded(
                                    child: Text(
                                      item.name ?? "-",
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
                                alignment: Alignment.centerRight,
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  item.nominal.toCurrency(symbol: "Rp. "),
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

  Widget _yesterdayMoneyExpenseBuild(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, provider, child) {
        var data = provider.listHistoryYesterday;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: context.padding2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Kemarin",
                style: context.paragraphBold,
              ),
              context.sbHeight(),
              ListView.separated(
                  itemCount: data.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (BuildContext context, int index) =>
                      context.sbHeight(size: context.padding2),
                  itemBuilder: (context, index) {
                    var item = data[index];
                    return ISlidable.primary(
                      onDelete: (context) {
                        provider.showPopUpConfirmation(context, index: item.index);
                      },
                      onUpdate: (context) {
                        provider.goToEdit(context, item: item);
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
                                children: [
                                  IIconCategory.iconWithColorInside(item.category ?? ""),
                                  context.sbWidth(),
                                  Text(
                                    item.name ?? "-",
                                    style: context.paragraphMedium?.copyWith(
                                      color: Palette.gray1,
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
                                  item.nominal.toCurrency(),
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
