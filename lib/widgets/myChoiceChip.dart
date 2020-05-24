import 'package:flutter/material.dart';

class MyChoiceChip extends StatelessWidget {
  final String text;
  final bool selected;

  MyChoiceChip({this.text, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(text),
      selected: selected,
      autofocus: false,
      labelStyle: TextStyle(color: Colors.blue),
      backgroundColor: Colors.blue,
      onSelected: (bool selected){},
    );
  }
}