import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:nexus_app/core/index.dart';

class AntiOtp extends StatefulWidget {
  final TextEditingController otpController;

  // Validator before hit API
  final String? Function(String?)? onValidator;

  // Function triggered when pin completed
  final void Function()? onFullfil;

  // Error text after get result from hit API
  final String? errorText;

  // If errorText not null, onResetError must be not null
  final void Function()? onResetError;

  const AntiOtp({super.key, required this.otpController, this.onValidator, this.onFullfil, this.onResetError, this.errorText});

  @override
  State<AntiOtp> createState() => _AntiOtpState();
}

class _AntiOtpState extends State<AntiOtp> {
  final _pinputFocusNode = FocusNode();
  String _errorText = '';

  @override
  void initState() {
    super.initState();
    if (widget.errorText != null && widget.onResetError == null) {
      throw ArgumentError('onResetError must be provided when errorText is not null, example : setState(() => errorText = '
          ');');
    }
    _pinputFocusNode.requestFocus();
  }

  Widget _buildErrorText() {
    String errorText = '';
    if (_errorText.isNotEmpty) {
      errorText = _errorText;
    }
    if (widget.errorText != null && widget.errorText!.isNotEmpty) {
      errorText = widget.errorText!;
    }
    return Text(
      errorText,
      style: bodyCaption.copyWith(color: error, fontWeight: FontWeight.w300),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildInputOtp() {
    return AntiContainer(
      width: double.infinity,
      crossAxis: CrossAxisAlignment.center,
      children: [
        PinCodeTextField(
          mainAxisAlignment: MainAxisAlignment.center,
          autoDisposeControllers: false,
          autoDismissKeyboard: true,
          appContext: context,
          length: otpLength.toInt(),
          controller: widget.otpController,
          focusNode: _pinputFocusNode,
          pinTheme: PinTheme(
            fieldOuterPadding: EdgeInsets.symmetric(horizontal: space.sm),
            shape: PinCodeFieldShape.underline,
            fieldWidth: otpItemWidthTheme,
            fieldHeight: otpItemHeightTheme,
            activeColor: border,
            inactiveColor: _errorText.isNotEmpty || (widget.errorText != null && widget.errorText!.isNotEmpty) ? error : border,
            selectedColor: primaryColor,
          ),
          textStyle: bodyH1.copyWith(
            color: primaryColor,
            fontWeight: FontWeight.w400,
            height: 1.50,
          ),
          pastedTextStyle: bodyH1.copyWith(
            color: primaryColor,
            fontWeight: FontWeight.w400,
            height: 1.50,
          ),
          animationCurve: Curves.easeInOut,
          animationType: AnimationType.scale,
          animationDuration: const Duration(milliseconds: 400),
          showCursor: true,
          cursorColor: primaryColor,
          cursorHeight: 34,
          cursorWidth: 1,
          hapticFeedbackTypes: HapticFeedbackTypes.selection,
          keyboardType: TextInputType.number,
          onCompleted: (value) {
            if (widget.onValidator != null) {
              dynamic validatorResult = widget.onValidator!(value);
              if (validatorResult != null) {
                setState(() {
                  _errorText = validatorResult;
                });
                widget.otpController.text = '';
                return;
              }
            }
            if (widget.onFullfil != null) {
              _pinputFocusNode.unfocus();
              widget.onFullfil!();
            }
          },
          onTap: () {
            if (widget.onResetError != null) {
              widget.onResetError!();
            }
            setState(() {
              if (_errorText.isNotEmpty) {
                setState(() {
                  _errorText = '';
                });
              }
            });
            _pinputFocusNode.requestFocus();
          },
          onChanged: (value) {},
        ),
        _buildErrorText()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildInputOtp();
  }
}
