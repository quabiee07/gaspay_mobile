import 'package:flutter/material.dart';


import '../../../../../core/domain/utils/qr_code_enums.dart';
import '../../../../receipt/presentation/screens/receipt_screen.dart';
import '../../widgets/reusable_order_qr_code_row.dart';

class RedeemedPortion extends StatefulWidget {
  const RedeemedPortion({super.key});

  @override
  State<RedeemedPortion> createState() => _RedeemedPortionState();
}

class _RedeemedPortionState extends State<RedeemedPortion> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ReusableOrderQrCodeRow(
                    productQuantity: '1 item',
                    productAmount: 'NGN 12,400',
                    fillingStationLocation: 'Smith Roundabout',
                    fillingStationName: 'Total Filling Station',
                    qrCodeData: 'i too good',
                    statusColour: const Color(0xFF23A26D),
                    date: '5th August, 2024. 08:06',
                    isQrcodeExpired: false,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ReceiptScreen(
                            qrCodeState: QrCodeState.redeemed,
                          ),
                        ),
                      );
                    },
                  );
                }),
          )
        ],
      ),
    );
  }
}
