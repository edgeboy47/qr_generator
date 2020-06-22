import 'package:flutter/material.dart';

class MyChoiceChip extends StatelessWidget {
  final String text;
  final bool selected;
  final Function onSelected;

  MyChoiceChip({@required this.text, @required this.onSelected, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(text),
      selected: selected,
      autofocus: false,
      labelStyle: TextStyle(color: Colors.blue),
      backgroundColor: Colors.black,
      onSelected: onSelected,
    );
  }
}