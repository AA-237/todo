import 'package:flutter/material.dart';

Widget buildTextField(void Function(String value)? func,{
  String? labelText,
  String? hintText,
  Widget? suffixIcon,
  Widget? preffixIcon,
  keyboardType,
  required bool isPasswordType,
  validator,
  TextEditingController? controller,
  
  
}) {
  return SizedBox(
    height: 55,
    child: TextFormField(
      validator: validator,
      controller: controller,
      obscureText: isPasswordType,
      keyboardType: keyboardType,
      onChanged: (value) => func!(value),
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: preffixIcon,
        suffixIcon: suffixIcon,
        
  
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35),
        ),
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(35)),
      ),
    ),
  );
}