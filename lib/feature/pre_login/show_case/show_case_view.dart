import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:money_expense/application/common/component/enum/enum.dart';
import 'package:money_expense/application/common/extension/context_extensions.dart';
import 'package:money_expense/feature/pre_login/welcome/welcome_view.dart';
import 'package:money_expense/route/base_route/route.dart';

import '../../../application/common/component/icon/i_icon_category.dart';
import '../../../application/common/component/theme/i_colors.dart';

class ShowCaseView extends StatelessWidget {
  static const routeName = "/ShowCaseView";

  const ShowCaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
      autoPlay: true,
      onStart: (index, key) {
        log('onStart: $index, $key');
      },
      onComplete: (index, key) {
        log('onComplete: $index, $key');
        if (index == 7) {
          goToNamed(context, routeName: WelcomeView.routeName, routeType: RouteType.pushReplace);
        }
      },
      blurValue: 1,
      autoPlayDelay: const Duration(seconds: 5),
      builder: (context) => const ShowCaseBuild(),
    );
  }
}

class ShowCaseBuild extends StatefulWidget {
  static const routeName = "/ShowCaseView";

  const ShowCaseBuild({super.key});

  @override
  State<ShowCaseBuild> createState() => _ShowCaseBuildState();
}

class _ShowCaseBuildState extends State<ShowCaseBuild> {
  final GlobalKey _one = GlobalKey();
  final GlobalKey _two = GlobalKey();
  final GlobalKey _three = GlobalKey();
  final GlobalKey _four = GlobalKey();
  final GlobalKey _five = GlobalKey();
  final GlobalKey _six = GlobalKey();
  final GlobalKey _seven = GlobalKey();
  final GlobalKey _eight = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ShowCaseWidget.of(context).startShowCase([
        _one,
        _two,
        _three,
        _four,
        _five,
        _six,
        _seven,
        _eight,
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (val) async {

      },
      child: Scaffold(
        floatingActionButton: Showcase(
          key: _eight,
          description: 'Kamu ingin menambahkan pengeluaranmu? Klik aku saja.',
          descriptionAlignment: TextAlign.center,
          targetShapeBorder: const CircleBorder(),
          child: FloatingActionButton(
            shape: const CircleBorder(),
            backgroundColor: Palette.primary,
            splashColor: Palette.secondary,
            tooltip: 'Tambah',
            onPressed: () {},
            child: const Icon(
              Icons.add,
              color: Palette.white,
            ),
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
                Showcase(
                  key: _four,
                  description:
                      'Kamu tidak perlu khawatir, kamu bisa melihat pengeluaran bedasarkan kategori',
                  descriptionAlignment: TextAlign.center,
                  child: Column(
                    children: [
                      _expensesByCategoryBuild(context),
                      context.sbHeight(size: context.padding1),
                    ],
                  ),
                ),
                Showcase(
                    key: _six,
                    description: 'Kamu juga bisa lihat list pengeluaran hari ini dan kemarin.',
                    descriptionAlignment: TextAlign.center,
                    child: Column(
                      children: [
                        context.sbHeight(size: context.padding1),
                        _todayMoneyExpenseBuild(context),
                        context.sbHeight(size: context.padding1),
                        context.sbHeight(size: context.padding1),
                        _yesterdayMoneyExpenseBuild(context),
                      ],
                    )),
                context.sbHeight(size: context.padding10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _headerBuild(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.padding2),
      child: Showcase(
        key: _one,
        description:
            'Hai, senang berkenalan dengan kamu. Ikuti aku terus ya untuk lebih memahami aplikasi pencatatan pengeluaran ini.',
        descriptionAlignment: TextAlign.center,
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
      ),
    );
  }

  Widget _todayExpensesBuild(BuildContext context) {
    return Expanded(
      child: Showcase(
        key: _two,
        description: 'Kamu dapat melihat total pengeluaran hari ini disini.',
        descriptionAlignment: TextAlign.center,
        targetBorderRadius: BorderRadius.circular(8),
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
                  "Rp. 1.000.000",
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
  }

  Widget _monthlyExpensesBuild(BuildContext context) {
    return Expanded(
      child: Showcase(
        key: _three,
        description: 'Kamu juga dapat melihat total pengeluaran bulan ini disini.',
        targetBorderRadius: BorderRadius.circular(8),
        descriptionAlignment: TextAlign.center,
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
                  "Rp. 50.000.000",
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
  }

  Widget _expensesByCategoryBuild(BuildContext context) {
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
              child: Row(children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        ShowCaseWidget.of(context).startShowCase([_one, _two, _three, _four, _five]);
                      },
                      child: Showcase(
                        key: _five,
                        description: "Jika kamu ingin melihat detailnya, klik saja salah satu dari aku",
                        descriptionAlignment: TextAlign.center,
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
                              IIconCategory.iconWithColorOutside("Food"),
                              context.sbHeight(
                                size: context.padding1,
                              ),
                              Text(
                                "Makanan",
                                style: context.captionMedium,
                              ),
                              context.sbHeight(
                                size: context.padding0,
                              ),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  "Rp. 200.000",
                                  style: context.captionBold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    context.sbWidth(),
                    InkWell(
                      onTap: () {},
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
                            IIconCategory.iconWithColorOutside("Internet"),
                            context.sbHeight(
                              size: context.padding1,
                            ),
                            Text(
                              "Internet",
                              style: context.captionMedium,
                            ),
                            context.sbHeight(
                              size: context.padding0,
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "Rp. 500.000",
                                style: context.captionBold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    context.sbWidth(),
                    InkWell(
                      onTap: () {},
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
                            IIconCategory.iconWithColorOutside("Internet"),
                            context.sbHeight(
                              size: context.padding1,
                            ),
                            Text(
                              "Internet",
                              style: context.captionMedium,
                            ),
                            context.sbHeight(
                              size: context.padding0,
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "Rp. 500.000",
                                style: context.captionBold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // context.sbWidth(),
                  ],
                ),
              ])),
        ],
      ),
    );
  }

  Widget _todayMoneyExpenseBuild(BuildContext context) {
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
          Showcase(
            key: _seven,
            description:
                "Jika kamu ingin edit atau delete, kamu bisa geser aku ke kanan untuk memunculkan menunya.",
            descriptionAlignment: TextAlign.center,
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
                        IIconCategory.iconWithColorInside("Food"),
                        context.sbWidth(),
                        Expanded(
                          child: Text(
                            "MC D",
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
                      child: Text(
                        "Rp. 100.000",
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
          ),
          context.sbHeight(),
          Container(
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
                      IIconCategory.iconWithColorInside("Internet"),
                      context.sbWidth(),
                      Expanded(
                        child: Text(
                          "Paket Data XL",
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
                    child: Text(
                      "Rp. 20.000",
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
        ],
      ),
    );
  }

  Widget _yesterdayMoneyExpenseBuild(BuildContext context) {
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
          Container(
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
                      IIconCategory.iconWithColorInside("Food"),
                      context.sbWidth(),
                      Expanded(
                        child: Text(
                          "MC D",
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
                    child: Text(
                      "Rp. 100.000",
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
          context.sbHeight(),
          Container(
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
                      IIconCategory.iconWithColorInside("Internet"),
                      context.sbWidth(),
                      Expanded(
                        child: Text(
                          "Paket Data XL",
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
                    child: Text(
                      "Rp. 20.000",
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
        ],
      ),
    );
  }
}
