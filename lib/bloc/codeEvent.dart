import 'package:flutter/foundation.dart';

abstract class CodeEvent{
  final Map <String, dynamic> data;

  const CodeEvent({@required this.data});
}

class TextCode extends CodeEvent {
  const TextCode({Map<String, dynamic> data}) : super(data: data);
}

class WifiCode extends CodeEvent {
  const WifiCode({Map<String, dynamic> data}) : super(data: data);
}

class ContactCode extends CodeEvent {
  const ContactCode({Map<String, dynamic> data}) : super(data: data);

}

class URLCode extends CodeEvent {
  const URLCode({Map<String, dynamic> data}) : super(data: data);
}