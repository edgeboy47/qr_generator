import 'package:flutter/foundation.dart';

abstract class CodeEvent{
  final Map <String, String> data;

  const CodeEvent({@required this.data});
}

class TextCode extends CodeEvent {
  const TextCode({Map<String, String> data}) : super(data: data);
}

class WifiCode extends CodeEvent {
  const WifiCode({Map<String, String> data}) : super(data: data);
}

class ContactCode extends CodeEvent {
  const ContactCode({Map<String, String> data}) : super(data: data);

}

class URLCode extends CodeEvent {
  const URLCode({Map<String, String> data}) : super(data: data);
}