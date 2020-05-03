import 'package:flutter/material.dart';
import 'package:qr_generator/pages/codeDisplayPage.dart';
import 'package:qr_generator/widgets/myScaffold.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();  
  }

  void codeGenerate() {
    String codeText = textController.text;

    Navigator.push(context, MaterialPageRoute(builder: (context) => CodeDisplayPage(text: codeText)));
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.green, width: 5.0)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextField(
                  controller: textController,
                ),
                RaisedButton(child: Text("Generate"), onPressed: codeGenerate)
              ],
            ),
          ),
        ),
    );
  }
}
