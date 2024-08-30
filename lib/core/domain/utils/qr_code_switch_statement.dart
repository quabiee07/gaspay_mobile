import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gaspay_mobile/core/domain/utils/qr_code_enums.dart';



class QrCodeSwitchStatement{
  QrCodeSwitchStatement({required this.qrCodeState});
  final QrCodeState qrCodeState;
  late Color borderColor;
  late Color textColor;
  late Color containerColor;
  late Widget icon;
  late Color qrCodeColor;
  late bool isExpired;


 void init() {
    switch (qrCodeState) {
      case QrCodeState.pending:
        borderColor = const Color(0xFFE15F00);
        textColor = const Color(0xFFCA3F00);
        containerColor = const Color(0xFFFFF9F6);
        icon = SvgPicture.asset("assets/images/redCautionIcon.svg");
        qrCodeColor=Colors.black;
        isExpired=false;
        break;
      case QrCodeState.redeemed:
        borderColor =const  Color(0xFF23A26D);
        textColor = const Color(0xFF002933);
        containerColor =  Colors.transparent;
        icon = SvgPicture.asset("assets/images/qrSuccessIcon.svg");
        qrCodeColor=Colors.black;
        isExpired=false;

        break;
      case QrCodeState.expired:
        borderColor = const Color(0xFFFF3B3B);
        textColor = const Color(0xFFCA3F00);
        containerColor= const Color(0xFFFFF9F6);
        icon = SvgPicture.asset("assets/images/redCautionIcon.svg");
        qrCodeColor=const Color(0xFFFF3B3B);
        isExpired=true;


        break;
    }
  }
}