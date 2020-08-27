import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Smeg/Screens/homeScreens/products/products.dart';
import 'package:Smeg/Screens/productScreens/cart/cart.dart';
import 'package:Smeg/Screens/productScreens/checkout/checkout.dart';
import 'package:Smeg/Screens/productScreens/details/details_screen.dart';
import 'package:Smeg/Screens/settings/setting.dart';
import 'package:Smeg/Screens/start/splash.dart';

import 'package:Smeg/Screens/start/start.dart';
import 'package:Smeg/ins/lang.dart';
import 'AppLocalizations.dart';
import 'Screens/homeScreens/home/home.dart';
import 'constants.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    INSLang.get_lang(onDone: () {
      setState(() {
        GlobalMaterialLocalizations.delegate.load(Locale('ar', ''));
        GlobalWidgetsLocalizations.delegate.load(Locale('ar', ''));
        GlobalCupertinoLocalizations.delegate.load(Locale('ar', ''));
      });
    });
  }

  onLocaleChange(Locale l) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return RestartWidget(
        child: MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('ar', ''),
      ],
      // locale: INSLang.isRTL() ? Locale('ar') : Locale('en'),
      debugShowCheckedModeBanner: false,
      title: 'Smeg',
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        ProductesScreen.id: (context) => ProductesScreen(),
        DetaillsScreen.id: (context) => DetaillsScreen(),
        CartScreen.id: (context) => CartScreen(),
        StartScreen.id: (context) => StartScreen(),
        CheckoutScreen.id: (context) => CheckoutScreen(),
        SettingsScreen.id: (context) => SettingsScreen()
      },
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    ));
  }
}

class RestartWidget extends StatefulWidget {
  RestartWidget({this.child});

  final Widget child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>().restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  @override
  void initState() {
    super.initState();
  }

  void restartApp() {
    INSLang.get_lang(onDone: () {
      setState(() {
        key = UniqueKey();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}
