import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../../core/domain/utils/qr_code_enums.dart';
import '../../../../../core/presentation/resources/drawables.dart';
import '../../../../../core/presentation/theme/colors/colors.dart';
import '../../../../../core/presentation/widgets/svg_image.dart';
import '../../../../receipt/presentation/screens/receipt_screen.dart';
import '../../widgets/reusable_order_qr_code_row.dart';

class ExpiredPortion extends StatefulWidget {
  const ExpiredPortion({super.key});

  @override
  State<ExpiredPortion> createState() => _ExpiredPortionState();
}

class _ExpiredPortionState extends State<ExpiredPortion> {
  final List<String> items = List.generate(10, (index) => 'Item ${index + 1}');
  double swipeProgress = 0.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
      ),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Dismissible(
                        key: Key(items[index]),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          color: archiveBlue,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          alignment: Alignment.centerRight,
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Container(
                                  color: archiveBlue,
                                ),
                              ),
                              Positioned(
                                right: swipeProgress *
                                    MediaQuery.of(context).size.width *
                                    0.5,
                                top: 0,
                                bottom: 0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SvgImage(asset: whiteArchiveIcon),
                                    const Gap(
                                      10,
                                    ),
                                    Text(
                                      "Archive",
                                      style:
                                          theme.textTheme.labelMedium!.copyWith(
                                        fontSize: 12,
                                        color: theme.colorScheme.surface,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        onUpdate: (details) {
                          setState(() {
                            swipeProgress = details.progress;
                          });
                        },
                        onDismissed: (direction) {
                          setState(() {
                            items.removeAt(index);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text('${items[index]} archived')),
                            );
                          });
                        },
                        child: ReusableOrderQrCodeRow(
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
                        ),
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
                }),
          )
        ],
      ),
    );
  }
}
