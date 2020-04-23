import 'package:flutter/material.dart';
import 'package:qr_generator/pages/homePage.dart';
import 'package:qr_generator/theme/theme.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: myDarkTheme,
      home: HomePage(),
    );
  }
}