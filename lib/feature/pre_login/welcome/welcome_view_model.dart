import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:money_expense/application/common/extension/context_extensions.dart';
import 'package:money_expense/feature/after_login/home/home_view.dart';
import 'package:money_expense/route/base_route/route.dart';

import '../../../application/common/component/button/i_button.dart';
import '../../../application/common/component/theme/i_colors.dart';
import '../../../application/constant/i_constant.dart';
import '../../../core/constant/i_storage.dart';

class WelcomeViewModel extends ChangeNotifier {
  WelcomeViewModel(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initPage(context);
    });
  }

  String getTimeOfDay() {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return "Pagi yang Cerah";
    } else if (hour >= 12 && hour < 15) {
      return "Siang yang Luar Biasa";
    } else if (hour >= 15 && hour < 18) {
      return "Sore Senja";
    } else {
      return "Malam yang indah";
    }
  }

  void initPage(BuildContext context) {}

  Future<void> showPopUpConfirmation(BuildContext context) async {
    context.showDialogWarningSimple(
      description:
          "Apakah kamu yakin akan keluar? Jika kamu keluar, kamu akan mengulangi tutorial dari awal.",
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

  Future<void> goToHome(BuildContext context) async {
    await IStorage.setValue(IConstant.afterLogin, true);
    if (context.mounted) {
      goToNamed(context, routeName: HomeView.routeName);
    }
  }
}
