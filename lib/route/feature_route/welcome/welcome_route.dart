import 'package:money_expense/feature/pre_login/welcome/welcome_view.dart';

import '../../base_route/model/route_model.dart';

List<RouteModel> welcomeRoute = [
  RouteModel(
    routeName: WelcomeView.routeName,
    widget: const WelcomeView(),
  ),
];