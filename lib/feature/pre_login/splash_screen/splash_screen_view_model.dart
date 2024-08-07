import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_expense/feature/pre_login/show_case/show_case_view.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../application/common/assets/assets.dart';
import '../../../application/common/component/enum/enum.dart';
import '../../../application/constant/i_constant.dart';
import '../../../core/constant/i_storage.dart';
import '../../../route/base_route/route.dart';
import '../../after_login/home/home_view.dart';

class SplashScreenViewModel extends ChangeNotifier {
  SplashScreenViewModel(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initPage(context);
    });
  }

  String? iconLogo = IAsset.splashScreenLottie;

  Future<void> initPage(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3)).then((value) async {
      bool isLogin = await IStorage.getValue(IConstant.afterLogin) ?? false;
      if (await checkPermissionStorageAndroid()) {
        if (isLogin == true) {
          if (context.mounted) {
            goToNamed(
              context,
              routeName: HomeView.routeName,
              routeType: RouteType.pushReplace,
            );
          }
          return;
        }
        if (context.mounted) {
          goToNamed(
            context,
            routeName: ShowCaseView.routeName,
            routeType: RouteType.pushReplace,
            arguments: context,
          );
        }
      }
    });
  }

  Future<bool> checkPermissionStorageAndroid() async {
    DeviceInfoPlugin plugin = DeviceInfoPlugin();
    AndroidDeviceInfo android = await plugin.androidInfo;
    if (android.version.sdkInt < 33) {
      var status = await Permission.storage.status;
      if (!status.isGranted) {
        status = await Permission.storage.request();
        if (status.isPermanentlyDenied) {
          await openAppSettings();
          status = await Permission.storage.status;
        }

        if (!status.isGranted) {
          return false;
        }
      }
    }
    return true;
  }
}
