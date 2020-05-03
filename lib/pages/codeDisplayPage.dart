import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_generator/widgets/myScaffold.dart';

class CodeDisplayPage extends StatelessWidget {
  final String text;
  CodeDisplayPage({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      child: Container(
        child: Center(
          child: QrImage(
            data: text,
            size: 200.0,
            backgroundColor: Colors.white,)
        ),
      ),
    );
  }
}
