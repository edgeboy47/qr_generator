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

  var payload = <String, dynamic>{};

  var codeToKeyMap = <Codes, GlobalKey<FormState>>{
    Codes.Text: GlobalKey<FormState>(),
    Codes.Contact: GlobalKey<FormState>(),
    Codes.Wifi: GlobalKey<FormState>(),
    Codes.URL: GlobalKey<FormState>(),
  };

  @override
  void dispose() {
    super.dispose();
  }

  void onPressed() {
    switch (currentCode) {
      case Codes.Text:
        BlocProvider.of<CodeBloc>(context).add(TextCode(data: payload));
        break;

      case Codes.Wifi:
        // BlocProvider.of<CodeBloc>(context).add(WifiCode(text: codeText));
        break;

      case Codes.URL:
        BlocProvider.of<CodeBloc>(context).add(URLCode(data: payload));
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
          payload = {};
        });
      },
    );
  }

  Form formBuilder() {
    Form form;

    switch (currentCode) {
      case Codes.Text:
        form = Form(
          key: codeToKeyMap[Codes.Text],
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: (value) {
                  return value.trim().isEmpty ? "Please enter some text" : null;
                },
                onSaved: (value) {
                  payload["text"] = value.trim();
                },
                maxLength: 200,
                decoration: InputDecoration(hintText: "Enter Text"),
              ),
              RaisedButton(
                child: Text("Generate QR Code"),
                onPressed: () {
                  if (codeToKeyMap[Codes.Text].currentState.validate()) {
                    codeToKeyMap[Codes.Text].currentState.save();
                    onPressed();
                  }
                },
              ),
            ],
          ),
        );
        break;

      case Codes.Contact:
        form = Form(
          key: codeToKeyMap[Codes.Contact],
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: (value) {
                  return value.isEmpty ? "Please enter some text" : null;
                },
                onSaved: (value) {
                  payload["text"] = value;
                },
                maxLength: 200,
                decoration: InputDecoration(hintText: "Enter Text"),
              ),
              RaisedButton(
                child: Text("Generate QR Code"),
                onPressed: () {
                  if (codeToKeyMap[Codes.Text].currentState.validate()) {
                    codeToKeyMap[Codes.Text].currentState.save();
                    onPressed();
                  }
                },
              ),
            ],
          ),
        );
        break;

      case Codes.URL:
        form = Form(
          key: codeToKeyMap[currentCode],
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: (value) {
                  final reg = RegExp(
                      r"^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$",
                      caseSensitive: false);

                  return reg.hasMatch(value.trim()) == false
                      ? "Please enter a valid URL"
                      : null;
                },
                onSaved: (value) {
                  payload["url"] = value.trim();
                },
                maxLength: 200,
                decoration: InputDecoration(hintText: "Enter URL"),
              ),
              RaisedButton(
                child: Text("Generate QR Code"),
                onPressed: () {
                  if (codeToKeyMap[currentCode].currentState.validate()) {
                    codeToKeyMap[currentCode].currentState.save();
                    onPressed();
                  }
                },
              ),
            ],
          ),
        );
        break;

      case Codes.Wifi:
        form = Form(
          key: codeToKeyMap[currentCode],
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: (value) {
                  return value.isEmpty ? "Please enter some text" : null;
                },
                onSaved: (value) {
                  payload["ssid"] = value;
                },
                maxLength: 200,
                decoration: InputDecoration(hintText: "Enter SSID"),
              ),
              TextFormField(
                validator: (value) {
                  return value.isEmpty ? "Please enter some text" : null;
                },
                onSaved: (value) {
                  payload["password"] = value;
                },
                maxLength: 200,
                decoration: InputDecoration(hintText: "Enter Password"),
              ),
              RaisedButton(
                child: Text("Generate QR Code"),
                onPressed: () {
                  if (codeToKeyMap[currentCode].currentState.validate()) {
                    codeToKeyMap[currentCode].currentState.save();
                    onPressed();
                  }
                },
              ),
            ],
          ),
        );
        break;
    }

    return form;
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // SizedBox(),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                ),
                child: Wrap(
                  children: Codes.values.map(codeToChipGenerator).toList(),
                ),
              ),
              formBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
