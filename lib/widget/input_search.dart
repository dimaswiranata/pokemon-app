import 'package:flutter/material.dart';
import 'package:nexus_app/core/index.dart';

class InputSearch extends StatefulWidget {
  final TextEditingController? keywordController;
  final void Function(String val)? onSearch;
  final void Function()? onClear;
  final double? marginHorizontal;
  final String? textHint;
  final FocusNode? focusNode;
  final bool? enabled;

  const InputSearch(
      {super.key,
      this.keywordController,
      this.onSearch,
      this.textHint,
      this.onClear,
      this.marginHorizontal = 16,
      this.focusNode,
      this.enabled});

  @override
  State<InputSearch> createState() => _InputSearchState();
}

class _InputSearchState extends State<InputSearch> {
  String? valueSearch = "";

  @override
  Widget build(BuildContext context) {
    Widget suffixIcon() {
      if (widget.keywordController?.text != "") {
        return AntiContainer(
          bgColor: primaryColor,
          onTap: () {
            setState(() {
              valueSearch = "";
            });

            if (widget.onClear != null) {
              widget.onClear!();
            }
          },
          margin: space.md,
          width: 18,
          height: 18,
          borderRadius: 100,
          child: Icon(
            Icons.close,
            size: typography.h3,
            color: Colors.black,
          ),
        );
      }
      return Icon(
        Icons.search,
        size: typography.h2,
        color: colors(context).appColorPrimary,
      );
    }

    return AntiContainer(
      height: 48,
      marginHorizontal: widget.marginHorizontal,
      child: TextFormField(
        enabled: widget.enabled,
        focusNode: widget.focusNode,
        controller: widget.keywordController,
        textAlignVertical: TextAlignVertical.center,
        onChanged: (value) {
          setState(() {
            valueSearch == value;
          });
          if (widget.onSearch != null) {
            widget.onSearch!(value);
          }
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: space.reg),
          hintText: widget.textHint,
          hintStyle: bodyBody.copyWith(color: primaryColor),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor, width: 1.0),
            borderRadius: BorderRadius.circular(40.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor, width: 1.0),
            borderRadius: BorderRadius.circular(40.0),
          ),
          suffixIcon: suffixIcon(),
        ),
      ),
    );
  }
}
