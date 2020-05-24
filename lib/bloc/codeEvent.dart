import 'package:flutter/foundation.dart';

abstract class CodeEvent{
  const CodeEvent();
}

class PlainTextCode extends CodeEvent {
  final String text;

  const PlainTextCode({@required this.text}): assert (text.length != 0);
}

class WifiCode extends CodeEvent {}

class ContactCode extends CodeEvent {}

class URLCode extends CodeEvent {}