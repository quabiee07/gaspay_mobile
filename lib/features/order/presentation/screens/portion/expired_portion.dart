import 'package:flutter/material.dart';
import '../../../../../core/domain/utils/qr_code_enums.dart';
import '../../../../receipt/presentation/screens/receipt_screen.dart';
import '../../widgets/reusable_order_qr_code_row.dart';


class ExpiredPortion extends StatefulWidget {
  const ExpiredPortion({super.key});

  @override
  State<ExpiredPortion> createState() => _ExpiredPortionState();
}

class _ExpiredPortionState extends State<ExpiredPortion> {
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
                  return  ReusableOrderQrCodeRow(
                    productQuantity: '1 item',
                    productAmount: 'NGN 12,400',
                    fillingStationLocation: 'Smith Roundabout',
                    fillingStationName: 'Total Filling Station',
                    qrCodeData: 'i too good',
                    statusColour: const Color(0xFFFF3B3B),
                    date: '5th August, 2024. 08:06',
                    isQrcodeExpired: true,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ReceiptScreen(
                            qrCodeState: QrCodeState.expired,
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
