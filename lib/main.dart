import "package:flutter/material.dart";
import "./screens/tabs_screen.dart";

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "food classification",
      home: TabsScreen(),
    );
  }
}
