import 'package:flutter/material.dart';
import 'package:gaspay_mobile/core/presentation/widgets/button.dart';
import 'package:gaspay_mobile/core/presentation/widgets/svg_image.dart';
import '../../../../core/domain/utils/qr_code_enums.dart';
import '../../../../core/domain/utils/qr_code_switch_statement.dart';
import '../../../../core/presentation/resources/drawables.dart';
import '../../../../core/presentation/theme/colors/colors.dart';
import '../../../../core/presentation/widgets/reusable_back_button_with_title.dart';
import '../../../bottom nav bar/presentation/screens/bottom_nav_bar.dart';
import '../widgets/dotted_line_painter.dart';
import '../widgets/reusable_qr_code.dart';
import '../widgets/reusable_receipt_row.dart';
import '../widgets/reusable_transaction_status_container.dart';

class ReceiptScreen extends StatefulWidget {
  const ReceiptScreen({super.key, required this.qrCodeState});

  final QrCodeState qrCodeState;

  @override
  State<ReceiptScreen> createState() => _ReceiptScreenState();
}

class _ReceiptScreenState extends State<ReceiptScreen> {
  late QrCodeSwitchStatement qrCodeSwitchStatement;
  late Widget icon;

  @override
  void initState() {
    super.initState();
    qrCodeSwitchStatement = QrCodeSwitchStatement(
      qrCodeState: widget.qrCodeState,
    );
    qrCodeSwitchStatement.init();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                ReusableBackButtonWithTitle(
                  isBackIconVisible: false,
                  prefixWidget: const SizedBox.shrink(),
                  suffixWidget: const Icon(
                    Icons.ios_share,
                    color: mediumGray2,
                  ),
                  isText: true,
                  title: "QR Code",
                  onTap: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
                ReusableQrCode(
                  qrCodeBorderColor: qrCodeSwitchStatement.borderColor,
                  qrCodeDate: "https://example.com",
                  qrCodeSize: 200.0,
                  borderWidth: 4,
                  borderSize: 20,
                  expiredIcon: const SvgImage(
                    asset: exclamationIcon,
                  ),
                  isQrcodeExpired: qrCodeSwitchStatement.isExpired,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 24,
                    bottom: 32,
                    left: 30,
                    right: 30,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: qrCodeSwitchStatement.containerColor,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          qrCodeSwitchStatement.icon,
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Text(
                              "This QR code expires after 72 hours and payment is nonrefundable",
                              textAlign: TextAlign.center,
                              style: theme.textTheme.labelMedium?.copyWith(
                                fontSize: 12,
                                color: qrCodeSwitchStatement.textColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 20,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 32,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: theme.colorScheme.surface,
                      boxShadow: [
                        BoxShadow(
                          color: lightGray3.withOpacity(0.10),
                          blurRadius: 10,
                          spreadRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ]),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: lightGray4,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Payment Details",
                              style: theme.textTheme.labelLarge
                                  ?.copyWith(fontSize: 16, color: lightGray5),
                            ),
                          ],
                        ),
                      ),
                      const ReusableReceiptRow(
                        isTailingText: true,
                        leadingText: 'Amount',
                        tailingText: 'NGN 12,300',
                        color: lightGray5,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const ReusableReceiptRow(
                        isTailingText: false,
                        widget: ReusableTransactionStatusContainer(),
                        leadingText: 'Payment Status',
                        tailingText: '',
                        color: lightGray5,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.transparent,
                              child: CustomPaint(
                                painter: DottedLinePainter(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      ReusableReceiptRow(
                        isTailingText: true,
                        leadingText: 'Reference Number',
                        tailingText: 'NHDGEH-HBHB12234HHH',
                        color: theme.colorScheme.onSurface,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      ReusableReceiptRow(
                        isTailingText: true,
                        leadingText: 'Sender’s Name',
                        tailingText: 'BRIGHT UWAOMA',
                        color: theme.colorScheme.onSurface,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      ReusableReceiptRow(
                        isTailingText: true,
                        leadingText: 'Receiver’s Name',
                        tailingText: 'TOTAL FILLING STATION',
                        color: theme.colorScheme.onSurface,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      ReusableReceiptRow(
                        isTailingText: true,
                        leadingText: 'Payment Date',
                        tailingText: 'Aug 07, 2024, 13:22:40',
                        color: theme.colorScheme.onSurface,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      ReusableReceiptRow(
                        isTailingText: true,
                        leadingText: 'Payment Method',
                        tailingText: 'Credit or Debit Card',
                        color: theme.colorScheme.onSurface,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const ReusableReceiptRow(
                        isTailingText: true,
                        leadingText: 'Status',
                        tailingText: 'Unredeemed',
                        color: darkYellow,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: BorderButton(
                        height: 58,
                        title: "Download Receipt",
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Button(
                          title: "Back to HomeScreen",
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const BottomNavBar(),
                              ),
                            );
                          }),
                      //       Button(title: 'Back to HomeScreen', onPressed: () { Navigator.of(context).pushReplacement(
                      //   MaterialPageRoute(
                      //     builder: (context) => const BottomNavBar(),
                      //   ),
                      // ); },

                      // CustomElevatedButton(
                      //   label: 'Back to HomeScreen',
                      //   onTap: () {
                      //     Navigator.of(context).pushReplacement(
                      //       MaterialPageRoute(
                      //         builder: (context) => const BottomNavBar(),
                      //       ),
                      //     );
                      //   },
                      // ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
