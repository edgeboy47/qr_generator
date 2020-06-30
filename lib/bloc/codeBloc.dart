import 'package:bloc/bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_generator/bloc/codeEvent.dart';

class CodeBloc extends Bloc<CodeEvent, QrCode> {
  final String initialString = "";

  @override
  QrCode get initialState => QrCode.fromData(
      data: initialString, errorCorrectLevel: QrErrorCorrectLevel.L);

  @override
  Stream<QrCode> mapEventToState(CodeEvent event) async* {
    if (event is TextCode) {
      final code = QrCode.fromData(
          data: event.data['text'], errorCorrectLevel: QrErrorCorrectLevel.L);
      code.make();
      yield code;
    }

    if (event is URLCode) {
      final code = QrCode.fromData(
          data: event.data['url'], errorCorrectLevel: QrErrorCorrectLevel.L);
      code.make();
      yield code;
    }

    if (event is WifiCode) {
      final ssid = event.data['ssid'];
      final password = event.data['password'] == null ? "nopass" : event.data['password'];
      final codeText = "WIFI:T:WPA;S:$ssid;P:$password;;";
      final code = QrCode.fromData(
        data: codeText, errorCorrectLevel: QrErrorCorrectLevel.L);

      code.make();
      yield code;
    }

    if(event is ContactCode) {
      
    }
  }
}
