import 'package:flutter/material.dart';
import 'package:gaspay_mobile/core/presentation/widgets/svg_image.dart';

import '../../../../core/presentation/resources/drawables.dart';
import '../../../receipt/presentation/widgets/reusable_qr_code.dart';


class ReusableOrderQrCodeRow extends StatelessWidget {
  const ReusableOrderQrCodeRow({
    super.key,
    required this.productQuantity,
    required this.productAmount,
    required this.fillingStationLocation,
    required this.fillingStationName,
    required this.qrCodeData,
    required this.statusColour,
    required this.date,
    required this.isQrcodeExpired,
    required this.onTap,
  });

  final String fillingStationName;
  final String fillingStationLocation;
  final String productQuantity;
  final String productAmount;
  final String date;
  final String qrCodeData;
  final Color statusColour;
  final bool isQrcodeExpired;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ReusableQrCode(
                  expiredIcon:const  SvgImage(asset: smallExclamationIcon,),
                  qrCodeBorderColor: statusColour,
                  qrCodeDate: qrCodeData,
                  qrCodeSize: 80,
                  borderWidth: 2,
                  borderSize: 10,
                  isQrcodeExpired: isQrcodeExpired,
                ),
                const SizedBox(
                  width: 24,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fillingStationName,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF002933)),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      fillingStationLocation,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF002933),),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    RichText(
                      text: TextSpan(
                        text: '$productQuantity - ',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF002933),
                          fontWeight: FontWeight.w400,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: productAmount,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF002933),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      date,
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF909090)),
                    ),
                  ],
                ),
              ],
            ),
            GestureDetector(
              onTap: onTap,
              child: const Text(
                "View QR code",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF1875F7)),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        const Divider(
          thickness: 1,
          color: Color(0xFFEDECEC),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
