import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gaspay_mobile/core/presentation/widgets/button.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import '../../../../core/domain/utils/qr_code_enums.dart';
import '../../../../core/presentation/manager/global_comment_controller.dart';
import '../../../../core/presentation/theme/colors/colors.dart';
import '../../../../core/presentation/widgets/reusable_back_button_with_title.dart';
import '../../../receipt/presentation/screens/receipt_screen.dart';

class CheckoutTransactionPinScreen extends StatefulWidget {
  const CheckoutTransactionPinScreen({super.key});

  @override
  State<CheckoutTransactionPinScreen> createState() => _CheckoutTransactionPinScreenState();
}

class _CheckoutTransactionPinScreenState extends State<CheckoutTransactionPinScreen> {
  @override
  void dispose() {
    GlobalCommentController.globalCommentController.dispose();
    super.dispose();
  }
  final otpFieldController = OtpFieldController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableBackButtonWithTitle(
                      isBackIconVisible: true,
                      isText: false,
                      title: "",
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                     Text(
                      'Enter transaction pin',
                      style:
                          theme.textTheme.labelLarge?.copyWith(
                            fontSize: 20,
                            color: theme.colorScheme.onSurface,
                          ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                     Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Enter your 4-digit transaction pin to perform this action.',
                            style:
                                theme.textTheme.labelSmall?.copyWith(
                                  fontSize: 16,
                                  color: mediumGray2,
                                ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Center(
                      child: OTPTextField(
                        controller: otpFieldController,
                        length: 4,
                        width: 210,
                        textFieldAlignment: MainAxisAlignment.spaceAround,
                        fieldWidth: 44,
                        fieldStyle: FieldStyle.box,
                        outlineBorderRadius: 10,
                        obscureText: true,
                        onChanged: (value) {},
                        onCompleted: (value) {
                          // provider.setOtp(value);
                          // provider.verifyOtp(email: email);
                        },
                        otpFieldStyle: OtpFieldStyle(
                          borderColor: theme.colorScheme.onSurface,
                          enabledBorderColor: theme.colorScheme.secondary,
                          backgroundColor: const Color(0xFFEFEFF1),
                          focusBorderColor: theme.colorScheme.onSurface,
                        ),
                        keyboardType: TextInputType.number,
                        style: theme.textTheme.titleLarge!.copyWith(fontSize: 20),
                        inputFormatter: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(1)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomElevatedButton(label: "Proceed", onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ReceiptScreen(qrCodeState: QrCodeState.pending,),
                        ),
                      );
                    },),
                  ),
                  // Button(title: "Proceed", onPressed: () {
                  //   Navigator.of(context).push(
                  //     MaterialPageRoute(
                  //       builder: (context) => const ReceiptScreen(qrCodeState: QrCodeState.pending,),
                  //     ),
                  //   );
                  // },),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Forgot Pin?",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFF46A2B),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}