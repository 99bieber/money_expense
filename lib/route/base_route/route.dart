import 'package:flutter/material.dart';
import 'package:money_expense/route/base_route/route_all.dart';

import '../../application/common/component/enum/enum.dart';
import '../../feature/page_not_found/page_not_found_view.dart';

Route<dynamic>? generateRoutes(RouteSettings settings) {
  Widget? widget;
  for (var data in RouteAll.allRoute) {
    if (data.routeName == settings.name) {
      widget = data.widget;
    }
  }
  return MaterialPageRoute(
    builder: (context) => widget ?? const PageNotFoundView(),
    settings: settings,
  );
  // RouteAll().getKey();
  // return MaterialPageRoute(
  //   builder: (context) => RouteAll.allRouteMap[settings.name]?.widget ?? const PageNotFoundView(),
  //   settings: settings,
  // );
}

//====GO TO PAGE====

///default navigator adalah pushNamed silakan isi RouteType susuai
///dengan yang diinginkan
Future goToNamed(
  BuildContext context, {
  RouteType? routeType,
  Object? arguments,
  required String routeName,
}) {
  if (routeType == RouteType.pushReplace) {
    return Navigator.pushReplacementNamed(context, routeName,
        arguments: arguments, result: ModalRoute.of(context)?.currentResult);
  }
  if (routeType == RouteType.pushRemove) {
    return Navigator.of(context).pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }
  return Navigator.pushNamed(context, routeName, arguments: arguments);
}

///default navigator adalah push silakan isi RouteType susuai
///dengan yang diinginkan
Future goTo(
  BuildContext context, {
  RouteType? routeType,
  Object? arguments,
  required Widget page,
}) {
  var pageRoute = MaterialPageRoute(
    builder: (context) => page,
    settings: RouteSettings(name: "/${page.toString()}", arguments: arguments),
  );
  if (routeType == RouteType.pushReplace) {
    return Navigator.pushReplacement(context, pageRoute, result: ModalRoute.of(context)?.currentResult);
  }
  if (routeType == RouteType.pushRemove) {
    return Navigator.of(context).pushAndRemoveUntil(
      pageRoute,
      (route) => false,
    );
  }
  return Navigator.push(
    context,
    pageRoute,
  );
}

///default navigator adalah push silakan isi RouteType susuai
///dengan yang diinginkan
Future goToSlide(
  BuildContext context, {
  RouteType? routeType,
  Object? arguments,
  required Widget page,
}) {
  var pageRoute = PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      var tween = Tween(begin: begin, end: end);
      final offsetAnimation = animation.drive(tween);
      return SlideTransition(
        position: offsetAnimation,
        child: page,
      );
    },
    settings: RouteSettings(name: "/${page.toString()}", arguments: arguments),
  );
  if (routeType == RouteType.pushReplace) {
    return Navigator.pushReplacement(context, pageRoute, result: ModalRoute.of(context)?.currentResult);
  }
  if (routeType == RouteType.pushRemove) {
    return Navigator.of(context).pushAndRemoveUntil(
      pageRoute,
      (route) => false,
    );
  }
  return Navigator.push(
    context,
    pageRoute,
  );
}
