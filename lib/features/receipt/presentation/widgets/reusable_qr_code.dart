import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';


class ReusableQrCode extends StatelessWidget {
  const ReusableQrCode({
    super.key,
    required this.qrCodeBorderColor,
    required this.qrCodeDate,
    required this.qrCodeSize,
    required this.borderWidth,
    required this.borderSize,
    required this.isQrcodeExpired,
    this.expiredIcon,
  });

  final double qrCodeSize;
  final String qrCodeDate;
  final Color qrCodeBorderColor;
  final double borderWidth;
  final double borderSize;
  final bool isQrcodeExpired;
  final Widget? expiredIcon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        QrImageView(
          eyeStyle: QrEyeStyle(
            color: isQrcodeExpired ? const Color(0xFFF5F6F7) : Colors.black,
            eyeShape: QrEyeShape.square,
          ),
          dataModuleStyle: QrDataModuleStyle(
            color: isQrcodeExpired ? const Color(0xFFF5F6F7) : Colors.black,
          ),
          data: qrCodeDate,
          version: QrVersions.auto,
          size: qrCodeSize,
        ),
        // Top-left corner
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            width: borderSize,
            height: borderSize,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: qrCodeBorderColor,
                  width: borderWidth,
                ),
                left: BorderSide(
                  color: qrCodeBorderColor,
                  width: borderWidth,
                ),
              ),
            ),
          ),
        ),
        // Top-right corner
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            width: borderSize,
            height: borderSize,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: qrCodeBorderColor,
                  width: borderWidth,
                ),
                right: BorderSide(
                  color: qrCodeBorderColor,
                  width: borderWidth,
                ),
              ),
            ),
          ),
        ),
        // Bottom-left corner
        Positioned(
          bottom: 0,
          left: 0,
          child: Container(
            width: borderSize,
            height: borderSize,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: qrCodeBorderColor,
                  width: borderWidth,
                ),
                left: BorderSide(
                  color: qrCodeBorderColor,
                  width: borderWidth,
                ),
              ),
            ),
          ),
        ),
        // Bottom-right corner
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: borderSize,
            height: borderSize,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: qrCodeBorderColor,
                  width: borderWidth,
                ),
                right: BorderSide(
                  color: qrCodeBorderColor,
                  width: borderWidth,
                ),
              ),
            ),
          ),
        ),
        isQrcodeExpired
            ? Column(
          children: [
            expiredIcon!,
          ],
        )
            : const SizedBox.shrink()
      ],
    );
  }
}
