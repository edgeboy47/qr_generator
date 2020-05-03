import 'package:flutter/material.dart';
import 'pages/homePage.dart';
import 'theme/theme.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Code Generator',
      theme: myDarkTheme,
      home: HomePage(),
    );
  }
}
