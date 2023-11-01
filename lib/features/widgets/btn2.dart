import 'package:flutter/material.dart';

Widget reuseableButton(void Function()? func,{
  String? text,
  // Function? onPressed,
}) {
  const shape = StadiumBorder();
  return SizedBox(
    width: double.infinity,
    height: 55,
    child: Container(
      decoration: const ShapeDecoration(
        shape: shape,
        color: Colors.brown

        // gradient: LinearGradient(
        //   colors: Color(0x0fd31919),
        // ),
      ),
      child: ElevatedButton(
        onPressed: func,
        style: ElevatedButton.styleFrom(
          // deactivate color and shadow
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Text(
          text!,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    ),
  );
}
