import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:money_expense/application/common/assets/assets.dart';
import 'package:money_expense/application/common/component/button/i_button.dart';
import 'package:money_expense/application/common/component/image/i_image.dart';
import 'package:money_expense/application/common/extension/context_extensions.dart';
import 'package:money_expense/feature/pre_login/welcome/welcome_view_model.dart';

class WelcomeView extends StatelessWidget {
  static const routeName = "/WelcomeView";

  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => WelcomeViewModel(context),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    return Consumer<WelcomeViewModel>(
      builder: (context, provider, child) {
        return PopScope(
          canPop: false,
          onPopInvoked: (val) async {
            provider.showPopUpConfirmation(context);
          },
          child: Scaffold(
            body: SingleChildScrollView(
              padding: EdgeInsets.all(context.padding2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const IImage(image: IAsset.welcomeLottie),
                  context.sbHeight(),
                  Text(
                    "Selamat Datang",
                    style: context.bigTitle,
                    textAlign: TextAlign.center,
                  ),
                  context.sbHeight(size: context.padding1),
                  Text(
                    provider.getTimeOfDay(),
                    style: context.paragraphSemiBold,
                    textAlign: TextAlign.center,
                  ),
                  context.sbHeight(size: context.padding1),
                  Text(
                    "Selamat!! kamu telah menyelesaikan tutorial dan silahkan menggunakan applikasi ini.",
                    style: context.paragraphRegular,
                    textAlign: TextAlign.center,
                  ),
                  context.sbHeight(size: context.padding4),
                  IButton.primary(onPressed: () {
                    provider.goToHome(context);
                  }, title: "Selesai"),
                  context.sbHeight(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
