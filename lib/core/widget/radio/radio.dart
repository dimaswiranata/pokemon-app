import 'package:flutter/material.dart';
import 'package:nexus_app/core/index.dart';

class AntiRadio extends StatelessWidget {
  const AntiRadio({super.key, this.height, this.width, required this.value, required this.groupValue, required this.onChanged});
  final dynamic value;
  final dynamic groupValue;
  final void Function(dynamic) onChanged;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 20,
      child: Radio(
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        fillColor: MaterialStateColor.resolveWith(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return primaryColor;
            }
            return primaryGrey;
          },
        ),
      ),
    );
  }
}
