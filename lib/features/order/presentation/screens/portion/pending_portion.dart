import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gaspay_mobile/core/presentation/resources/drawables.dart';
import 'package:gaspay_mobile/core/presentation/widgets/svg_image.dart';
import '../../../../../core/domain/utils/qr_code_enums.dart';
import '../../../../../core/presentation/theme/colors/colors.dart';
import '../../../../receipt/presentation/screens/receipt_screen.dart';
import '../../widgets/reusable_order_qr_code_row.dart';

class PendingPortion extends StatefulWidget {
  const PendingPortion({super.key});

  @override
  State<PendingPortion> createState() => _PendingPortionState();
}

class _PendingPortionState extends State<PendingPortion> {
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
                itemCount: items.length,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SvgImage(asset: whiteArchiveIcon),
                                      const Gap(
                                        10,
                                      ),
                                      Text(
                                        "Archive",
                                        style: theme.textTheme.labelMedium!
                                            .copyWith(
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
                            statusColour: const Color(0xFFE15F00),
                            date: '5th August, 2024. 08:06',
                            isQrcodeExpired: false,
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const ReceiptScreen(
                                    qrCodeState: QrCodeState.pending,
                                  ),
                                ),
                              );
                            },
                          )),
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
