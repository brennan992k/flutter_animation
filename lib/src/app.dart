import 'package:flutter/material.dart';
import 'package:test/src/screens/Home.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Test',
      home: Home(),
    );
  }
}
