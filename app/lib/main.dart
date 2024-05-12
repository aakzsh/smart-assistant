import 'package:flutter/material.dart';
import 'package:smartassistant/screens/landing.dart';


void main() async {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: "SHRA",
    home: Landing(),
    );
  }
}