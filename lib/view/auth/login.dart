import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/my_theme/my_theme.dart';
import 'package:todo_app/view/widgets/item_task_tff.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            ItemTaskTFF(
                label: "E-mail",
                hint: "Enter e-mail",
                controller: TextEditingController(),
                keyboardType: TextInputType.emailAddress),
            const SizedBox(
              height: 24,
            ),
            ItemTaskTFF(
                label: "Password",
                hint: "Enter password",
                controller: TextEditingController(),
                keyboardType: TextInputType.text,
                isObscure: true),
            SizedBox(
              height: 24,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: MyTheme.primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "Login",
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: MyTheme.whiteColor),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
