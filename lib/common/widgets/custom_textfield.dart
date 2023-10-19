import 'package:flutter/material.dart';
import 'package:todo/common/utils/constants.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    this.keyboardType,
    required this.hintText,
    this.prefixIcon,
    this.textStyle,
    this.controller,
    this.onchange,
  });

  final TextInputType? keyboardType;
  final String hintText;
  final Widget? prefixIcon;
  final TextStyle? textStyle;
  final TextEditingController? controller;
  void Function(String)? onchange;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConstant.aWidth * 0.9,
      decoration: BoxDecoration(
        color: AppConstant.aLight,
        borderRadius: BorderRadius.all(
          Radius.circular(AppConstant.aRadius),
        ),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        cursorHeight: 20,
        onChanged: onchange,
        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(color: AppConstant.aBgDark, width: 0.5)),
        ),
      ),
    );
  }
}
