import 'package:flutter/material.dart';

class MyScaffold extends StatelessWidget {

  final Widget child;

  MyScaffold({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Code Gen'),
        ),
        body: SafeArea(child: child));
  }
}
