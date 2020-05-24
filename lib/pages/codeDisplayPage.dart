import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_generator/bloc/codeBloc.dart';
import 'package:qr_generator/widgets/myScaffold.dart';

class CodeDisplayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      child: Container(
        child: Center(
          child: BlocBuilder(
            bloc: BlocProvider.of<CodeBloc>(context),
            builder: (context, state) {
              return QrImage.withQr(qr: state);
            })),
      ),
    );
  }
}
