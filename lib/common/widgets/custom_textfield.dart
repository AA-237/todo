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
    this.icon,
  });

  final TextInputType? keyboardType;
  final String hintText;
  final Widget? prefixIcon;
  final TextStyle? textStyle;
  final TextEditingController? controller;
  final Widget? icon;
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
      child: Row(
        
      )
    );
  }
}
