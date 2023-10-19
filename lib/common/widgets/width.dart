import 'package:flutter/material.dart';

class WidthSpacer extends StatelessWidget {
  const WidthSpacer({super.key, required this.wid});

  final double wid;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: wid,
    );
  }
}