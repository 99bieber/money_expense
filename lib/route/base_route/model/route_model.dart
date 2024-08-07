import 'package:flutter/material.dart';

class RouteModel {
  RouteModel({required this.routeName, required this.widget});

  String routeName;
  Widget widget;

  factory RouteModel.fromJson(Map<String, dynamic> json) => RouteModel(
        routeName: json["idaccount"],
        widget: json["widget"],
      );

  Map<String, dynamic> toJson() => {
        "routeName": routeName,
        "widget": widget,
      };
}

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Future<T?>? navigateTo<T>(String routeName, {Object? arguments}) {
    return navigatorKey.currentState?.pushNamed(routeName, arguments: arguments);
  }
}
