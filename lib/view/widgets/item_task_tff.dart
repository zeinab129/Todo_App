import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/my_theme/my_theme.dart';

class ItemTaskTFF extends StatelessWidget {
  String label, hint;
  TextEditingController controller;
  TextInputType? keyboardType;
  bool? isObscure;
  Function validate;

  ItemTaskTFF(
      {super.key,
      required this.label,
      required this.hint,
      required this.controller,
      this.keyboardType = TextInputType.text,
      this.isObscure = false,
      required this.validate});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: isObscure!,
      validator: (value) => validate(value),
      decoration: InputDecoration(
          labelText: label,
          labelStyle: GoogleFonts.poppins(color: MyTheme.primaryColor),
          hintText: hint,
          hintStyle: GoogleFonts.poppins(color: MyTheme.greyColor),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  const BorderSide(color: MyTheme.primaryColor, width: 2)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  const BorderSide(color: MyTheme.primaryColor, width: 2)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
              const BorderSide(color: MyTheme.redColor, width: 2)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: MyTheme.redColor, width: 2))),
      controller: controller,
    );
  }
}
