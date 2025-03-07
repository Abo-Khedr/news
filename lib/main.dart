import 'package:flutter/material.dart';
import 'package:news/home/home_screen.dart';
import 'package:news/home/news/news_details.dart';
import 'package:news/my_app_theme.dart';
import 'package:news/splash_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyAppTheme.lightTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale('en'),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName : (context) => SplashScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        NewsDetails.routeName : (context ) => NewsDetails(),
      },
    );
  }
}
