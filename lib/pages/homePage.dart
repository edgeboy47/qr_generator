import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_generator/bloc/codeBloc.dart';
import 'package:qr_generator/bloc/codeEvent.dart';
import 'package:qr_generator/pages/codeDisplayPage.dart';
import 'package:qr_generator/widgets/myChoiceChip.dart';
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

    BlocProvider.of<CodeBloc>(context).add(PlainTextCode(text: codeText));
    
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CodeDisplayPage()));
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              // Container(
              //   decoration: BoxDecoration(
              //     border: Border.all(color: Colors.white)
              //   ),
              //   child: Wrap(
              //     children: <Widget>[
              //       MyChoiceChip(text: "Plain Text", selected: true,),
              //       MyChoiceChip(text: "Wifi")
              //     ],
              //   ),
              // ),
              TextField(
                maxLength: 200,
                decoration: InputDecoration(hintText: "Enter Text"),
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
