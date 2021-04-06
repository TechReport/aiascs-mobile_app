import 'package:flutter/material.dart';

class QrCodeValidate extends StatelessWidget {
 static bool validateQrcode(String qrCodeValue) {
    if (qrCodeValue.isEmpty || qrCodeValue == null) return false;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
