import 'package:flutter/material.dart';
import 'package:login_screen/constants.dart';


class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final FormFieldValidator validator;
  final bool obscureText;
  final String hintText;

  const CustomTextField(
      {Key? key,
        required this.hintText,
        required this.validator,
        required this.controller,
        required this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: TextInputType.text,
      scrollPadding: const EdgeInsets.all(4),
      obscureText: obscureText,
      cursorColor: Colors.black,
      textAlign: TextAlign.end,
      decoration: InputDecoration(
        fillColor: Colors.grey.shade400,
          filled: true,
          hintText: hintText,
          hintStyle: kHintTextTextStyle,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.blue.shade600),
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          // نغییر حالت بوردر زمانی که کاربر روی بوردر کلیک میکند
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: Colors.blue.shade600),
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          // تغییر حالت بوردر زمانی که کاربر اطلاعات اشتباه وارد میکند
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          errorStyle: const TextStyle(fontSize: 14, color: Colors.red)),
    );
  }
}
