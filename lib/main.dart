import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import "./screens/tabs_screen.dart";
import "./screens/onboarding_screen.dart";

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FoodSnap",
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(222, 230, 232, 1),
        splashColor: const Color.fromRGBO(50, 75, 80, 1),
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          color: Color.fromRGBO(222, 230, 232, 1),
          elevation: 0,
          iconTheme: IconThemeData(
            color: Color.fromRGBO(50, 75, 80, 1),
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color.fromRGBO(222, 230, 232, 1),
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
        ),
        textTheme: const TextTheme(),
        iconTheme: const IconThemeData(
          color: Color.fromRGBO(50, 75, 80, 1),
        ),
      ),
      home: OnboardingScreen(),
      routes: {
        TabsScreen.routeName: (_) => TabsScreen()
      },
    );
  }
}
