import 'package:flutter/cupertino.dart';
import 'package:kolica/Packege/FlushBar/flushbar.dart';
import 'package:kolica/Packege/FlushBar/flushbar_helper.dart';
import 'package:kolica/main.dart';

void SuccessMessage(BuildContext context, {String message = ''}) {
  FlushbarHelper.createSuccess(message: message, position: FlushbarPosition.TOP)
    ..show(context);
}

void ErrorMessage(BuildContext context, {var message = ''}) {
  FlushbarHelper.createError(
      message: message.runtimeType == String
          ? message
          : language.Something_went_wrong,
      position: FlushbarPosition.TOP)
    ..show(context);
}
