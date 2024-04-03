
import 'package:flutter/material.dart';
import 'package:smartassistant/screens/home.dart';

void main(){
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: "Smart Assistant",
    home: Home(),
    );
  }
}