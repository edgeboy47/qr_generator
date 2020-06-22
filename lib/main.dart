import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_generator/bloc/codeBloc.dart';
import 'pages/homePage.dart';
import 'theme/theme.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CodeBloc>(
      create: (context) => CodeBloc(),
      child: MaterialApp(
        title: 'QR Code Generator', 
        theme: myDarkTheme, 
        home: HomePage()
      ),
    );
  }
}
