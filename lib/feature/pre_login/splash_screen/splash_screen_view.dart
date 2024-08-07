
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:money_expense/application/common/extension/context_extensions.dart';
import 'package:money_expense/feature/pre_login/splash_screen/splash_screen_view_model.dart';

import '../../../application/common/component/image/i_image.dart';
import '../../../application/common/component/theme/i_colors.dart';

class SplashScreenView extends StatelessWidget {
  static const routeName = "/SplashScreenView";

  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => SplashScreenViewModel(context),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context){
    return PopScope(
      canPop: false,
      onPopInvoked: (val) async {
        exit(1);
      },
      child: Scaffold(
        backgroundColor: Palette.secondary,
        body: Consumer<SplashScreenViewModel>(
          builder: (context, provider, child) {
            return SizedBox(
              height: context.mQHeight(1),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IImage(
                      image: provider.iconLogo,
                    ),
                    context.sbHeight(),
                    Text("Money Expence", style: context.bigTitle,)
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
