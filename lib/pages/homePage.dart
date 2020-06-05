import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_generator/bloc/blocs.dart';
import 'package:qr_generator/enum/enums.dart';
import 'package:qr_generator/pages/codeDisplayPage.dart';
import 'package:qr_generator/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textController = TextEditingController();
  var currentCode = Codes.Text;

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void onPressed() {
    String codeText = textController.text;

    switch (currentCode) {
      case Codes.Text:
        BlocProvider.of<CodeBloc>(context).add(TextCode(data: {'text': codeText}));
        break;

      case Codes.Wifi:
        // BlocProvider.of<CodeBloc>(context).add(WifiCode(text: codeText));
        break;

      case Codes.URL:
        // BlocProvider.of<CodeBloc>(context).add(URLCode(text: codeText));
        break;

      case Codes.Contact:
        // BlocProvider.of<CodeBloc>(context).add(ContactCode(text: codeText));
        break;
    }

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CodeDisplayPage()));
  }

  // Generates a ChoiceChip from the given enum value
  Widget codeToChipGenerator(Codes code) {
    return MyChoiceChip(
        text: describeEnum(code),
        selected: currentCode == code,
        onSelected: (bool selected) {
          setState(() {
            currentCode = code;
          });
        });
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
              Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.white)),
                child: Wrap(
                    children: Codes.values.map(codeToChipGenerator).toList()),
              ),
              TextField(
                maxLength: 200,
                decoration: InputDecoration(hintText: "Enter Text"),
                controller: textController,
              ),
              RaisedButton(
                  child: Text("Generate $currentCode"), onPressed: onPressed),
            ],
          ),
        ),
      ),
    );
  }
}
