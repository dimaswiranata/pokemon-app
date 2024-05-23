import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:nexus_app/core/index.dart';

class AntiPin extends StatefulWidget {
  final TextEditingController pinController;

  // Validator before hit API
  final dynamic Function(dynamic)? onValidator;

  // Function triggered when pin completed
  final void Function()? onFullfil;

  // Error text after get result from hit API
  final String? errorText;

  // If errorText not null, onResetError must be not null
  final void Function()? onResetError;

  // Focus node
  final FocusNode focusNode;

  final void Function(String)? onChanged;

  const AntiPin({
    super.key,
    required this.pinController,
    this.onValidator,
    this.onFullfil,
    this.onResetError,
    this.errorText,
    this.onChanged,
    required this.focusNode,
  });

  @override
  State<AntiPin> createState() => _AntiPinState();
}

class _AntiPinState extends State<AntiPin> {
  late FocusNode _pinputFocusNode;
  String _errorText = '';

  @override
  void initState() {
    super.initState();
    if (widget.errorText != null && widget.onResetError == null) {
      throw ArgumentError('onResetError must be provided when errorText is not null, example : setState(() => errorText = '
          ');');
    }
    _pinputFocusNode = widget.focusNode;
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

  Widget _buildInactivePin() {
    return AntiContainer(
      width: pinItemWidthTheme,
      height: pinItemHeightTheme,
      alignment: Alignment.center,
      child: AntiContainer(
        height: space.md,
        width: space.md,
        bgColor: _errorText.isNotEmpty || (widget.errorText != null && widget.errorText!.isNotEmpty) ? error : border,
        borderRadius: radius.full,
      ),
    );
  }

  Widget _buildActivePin() {
    return AntiContainer(
      width: pinItemWidthTheme,
      height: pinItemHeightTheme,
      alignment: Alignment.center,
      child: AntiContainer(
        height: space.md,
        width: space.md,
        bgColor: primaryColor,
        borderRadius: radius.full,
      ),
    );
  }

  Widget _buildInputPin() {
    return AntiContainer(
      width: double.infinity,
      crossAxis: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            AntiContainer(
              mainAxis: MainAxisAlignment.center,
              flexDir: FlexDirection.ROW,
              children: [
                for (var i = 0; i < pinLength; i++) _buildInactivePin(),
              ],
            ),
            PinCodeTextField(
              mainAxisAlignment: MainAxisAlignment.center,
              autoDisposeControllers: false,
              autoDismissKeyboard: true,
              appContext: context,
              length: pinLength.toInt(),
              controller: widget.pinController,
              focusNode: _pinputFocusNode,
              pinTheme: PinTheme(
                  shape: PinCodeFieldShape.underline,
                  fieldWidth: pinItemWidthTheme,
                  fieldHeight: pinItemHeightTheme,
                  activeColor: Colors.transparent,
                  inactiveColor: Colors.transparent,
                  selectedColor: Colors.transparent,
                  borderWidth: 0,
                  activeBorderWidth: 0,
                  errorBorderWidth: 0,
                  inactiveBorderWidth: 0,
                  disabledBorderWidth: 0,
                  selectedBorderWidth: 0),
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
              obscuringWidget: _buildActivePin(),
              showCursor: false,
              cursorColor: primaryWhite.withOpacity(0.5),
              blinkWhenObscuring: true,
              blinkDuration: const Duration(milliseconds: 400),
              animationCurve: Curves.easeInOut,
              animationType: AnimationType.scale,
              animationDuration: const Duration(milliseconds: 400),
              // separatorBuilder: (context, index) => SizedBox(width: space.xs),
              keyboardType: TextInputType.number,
              hapticFeedbackTypes: HapticFeedbackTypes.selection,
              onCompleted: (value) {
                if (widget.onValidator != null) {
                  dynamic validatorResult = widget.onValidator!(value);
                  if (validatorResult != null) {
                    setState(() {
                      _errorText = validatorResult;
                    });
                    widget.pinController.text = '';
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
              onChanged: widget.onChanged,
            ),
          ],
        ),
        _buildErrorText()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildInputPin();
  }
}
