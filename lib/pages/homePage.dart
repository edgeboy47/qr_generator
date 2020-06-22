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
  Codes currentCode = Codes.Text;
  var payload = {};
  var codeToKeyMap = <Codes, GlobalKey<FormState>>{
    Codes.Text: GlobalKey<FormState>(),
  };

  @override
  void dispose() {
    super.dispose();
  }

  void onPressed() {
    switch (currentCode) {
      case Codes.Text:
        BlocProvider.of<CodeBloc>(context)
            .add(TextCode(data: {'text': payload["text"]}));
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
              Form(
                key: codeToKeyMap[Codes.Text],
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      validator: (value) {
                        return value.isEmpty ? "Please enter text" : null;
                      },
                      onSaved: (value) {
                        payload["text"] = value;
                      },
                      maxLength: 200,
                      decoration: InputDecoration(hintText: "Enter Text"),
                    ),
                    RaisedButton(
                      child: Text("Generate $currentCode"),
                      onPressed: () {
                        if (codeToKeyMap[Codes.Text].currentState.validate()) {
                          codeToKeyMap[Codes.Text].currentState.save();
                          onPressed();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
