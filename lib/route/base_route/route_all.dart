import '../feature_route/add_new_entry/add_new_entry_route.dart';
import '../feature_route/detail_category/detail_category_route.dart';
import '../feature_route/home/home_route.dart';
import '../feature_route/show_case/show_case_route.dart';
import '../feature_route/splash_screen/splash_screen_route.dart';
import '../feature_route/welcome/welcome_route.dart';
import 'model/route_model.dart';

class RouteAll {
  RouteAll._();

  static Map<String, RouteModel> allRouteMap = {};

  static List<RouteModel> allRoute = [
    ...splashScreenRoute,
    ...homeRoute,
    ...addNewEntryRoute,
    ...detailCategoryRoute,
    ...showCaseRoute,
    ...welcomeRoute,
  ];
}
