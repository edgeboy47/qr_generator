import 'package:bloc/bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_generator/bloc/codeEvent.dart';

class CodeBloc extends Bloc<CodeEvent, QrCode> {
  final String initialString = "";
  
  @override
  QrCode get initialState => QrCode.fromData(data: initialString, errorCorrectLevel: QrErrorCorrectLevel.L);

  @override
  Stream<QrCode> mapEventToState(CodeEvent event) async*{
      if(event is PlainTextCode){
        final code = QrCode.fromData(data: event.text, errorCorrectLevel: QrErrorCorrectLevel.L);
        code.make();
        yield code;
      }
    
  }
  
  
}