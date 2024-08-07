import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:money_expense/route/base_route/model/route_model.dart';

import 'application/common/theme/i_button_theme.dart';
import 'application/common/theme/i_input_decoration_theme.dart';
import 'application/common/theme/i_text_theme.dart';
import 'application/db/hive/t_history_money_expense.dart';
import 'feature/pre_login/splash_screen/splash_screen_view.dart';
import 'route/base_route/route.dart';

Future<void> main() async {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/fonts/SIL Open Font License.txt');
    yield LicenseEntryWithLineBreaks(['assets/fonts'], license);
  });

  await Hive.initFlutter();
  Hive.registerAdapter(TableHistoryMoneyExpenseAdapter());
  // Hive.registerAdapter(PersonModelAdapter());

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return _buildMaterial(context);
  }

  Widget _buildMaterial(BuildContext context) {
    return MaterialApp(
      key: _scaffoldKey,
      navigatorKey: NavigationService.navigatorKey,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: generateRoutes,
      initialRoute: SplashScreenView.routeName,
      supportedLocales: const <Locale>[Locale('id', 'ID')],
      localeListResolutionCallback: (locales, supportedLocales) {
        return const Locale('id', 'ID');
      },
      locale: const Locale('id', 'ID'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
          child: child ?? const SizedBox(),
        );
      },
      theme: ThemeData(
        fontFamily: 'SourceSansPro',
        textButtonTheme: IButtonTheme.textButtonThemeData(),
        inputDecorationTheme: IInputDecorationTheme.primary(),
        extensions: [
          ITextTheme.textThemeMaterial2,
        ],
      ),
    );
  }
}
