import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gaspay_mobile/core/presentation/resources/drawables.dart';
import 'package:gaspay_mobile/core/presentation/widgets/clickable.dart';
import 'package:gaspay_mobile/core/presentation/widgets/inputfield_state.dart';
import 'package:gaspay_mobile/core/presentation/widgets/svg_image.dart';

class InputField2 extends TextFieldParent {
  const InputField2({
    required this.hint,
    super.key,
    required super.onChange,
    super.value,
    super.isPassword,
    this.prefix,
    this.suffix,
    this.readOnly = false,
    this.maxLines = 1,
    this.maxLength,
    this.error,
    this.isClear = false,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.done,
    this.minLines = 1,
    this.onAction,
    this.height = 60,
    this.width,
  });

  final Widget? prefix;
  final Widget? suffix;

  final bool readOnly;

  final int maxLines;
  final int? maxLength;
  final String? error;
  final String hint;
  final bool isClear;

  final TextInputType inputType;

  final TextInputAction inputAction;

  final VoidCallback? onAction;

  final int minLines;
  final double height;
  final double? width;

  @override
  TextFieldState createState() => _InputField2State();
}

class _InputField2State extends TextFieldState<InputField2> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: widget.width,
          height: widget.height,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(
            right: 10,
            left: 10,
            top: controller.text.isNotEmpty
                ? 14
                : focus.hasFocus
                    ? 14
                    : 0,
          ),
          decoration: BoxDecoration(
            border: Border.all(
                color: controller.text.isEmpty
                    ? theme.colorScheme.secondary
                    : widget.error != null
                        ? theme.colorScheme.error
                        : const Color(0xFF768589),
                width: 1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Row(
              children: <Widget>[
                widget.prefix ?? const SizedBox(),
                Expanded(
                  child: TextFormField(
                    controller: controller,
                    focusNode: focus,
                    readOnly: widget.readOnly,
                    showCursor: true,
                    obscureText: isPassword,
                    maxLines: widget.maxLines,
                    minLines: widget.minLines,
                    maxLength: widget.maxLength,
                    onEditingComplete: widget.onAction,
                    textInputAction: widget.inputAction,
                    keyboardType: widget.inputType,
                    style: theme.textTheme.labelMedium,
                    cursorColor: theme.colorScheme.onSurface,
                    onTapOutside: (_) {
                      focus.unfocus();
                    },
                    decoration: InputDecoration(
                      hintText: '',

                      suffix: widget.suffix ??
                          const SizedBox(
                            width: 20,
                            height: 20,
                          ),
                      // errorText: widget.error,
                      labelText: widget.hint,
                      labelStyle: theme.textTheme.labelMedium?.copyWith(
                        fontSize: 15,
                        color: controller.text.isEmpty
                            ? const Color(0xFF909090)
                            : const Color(0xFF768589),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      border: InputBorder.none,
                      hintStyle: theme.textTheme.labelMedium?.copyWith(
                        fontSize: 14,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                  ),
                ),
                widget.isPassword
                    ? Clickable(
                        onPressed: () => setState(() {
                          isPassword = !isPassword;
                        }),
                        child: Container(
                          width: 20,
                          height: 20,
                          alignment: Alignment.center,
                          child: SvgImage(
                            asset:
                                isPassword ? icVisibilityOff : icVisibilityOn,
                            width: 20,
                            height: 20,
                            color: theme.colorScheme.onSurface.withOpacity(0.7),
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      )
                    : widget.isClear && value.isNotEmpty
                        ? Clickable(
                            onPressed: () {
                              controller.clear();
                            },
                            child: SvgImage(
                              asset: '',
                              width: 24,
                              height: 24,
                              color:
                                  theme.colorScheme.onSurface.withOpacity(0.7),
                              fit: BoxFit.scaleDown,
                            ),
                          )
                        : widget.suffix ??
                            const SizedBox(
                              width: 20,
                              height: 20,
                            ),
              ],
            ),
          ),
        ),
        widget.isPassword
            ? widget.error != null
                ? Padding(
                    padding: const EdgeInsets.only(top: 4, left: 5),
                    child: Row(
                      children: [
                        Icon(
                          Icons.warning_rounded,
                          color: theme.colorScheme.error,
                          size: 18,
                        ),
                        const Gap(8),
                        const Text(
                          'Please follow instructions below',
                        ),
                      ],
                    ))
                : const SizedBox()
            : widget.error != null
                ? Padding(
                    padding: const EdgeInsets.only(top: 0, left: 5),
                    child: Text(
                      widget.error!,
                    ))
                : const SizedBox(),
        // widget.additionalNote != null ? const Gap(1) : const SizedBox(),
        // widget.additionalNote != null
        //     ? Text(widget.additionalNote!)
        //     : const SizedBox(),
      ],
    );
  }
}
