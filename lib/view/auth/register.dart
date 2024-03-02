import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/firebase/firebase_functions.dart';
import 'package:todo_app/my_theme/my_theme.dart';

import '../widgets/item_task_tff.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            ItemTaskTFF(
                label: "Username",
                hint: "Enter user_name",
                controller: usernameController,
                keyboardType: TextInputType.name),
            const SizedBox(
              height: 24,
            ),
            ItemTaskTFF(
                label: "E-mail",
                hint: "Enter e-mail",
                controller: emailController,
                keyboardType: TextInputType.emailAddress),
            const SizedBox(
              height: 24,
            ),
            ItemTaskTFF(
                label: "Phone",
                hint: "Enter phone number",
                controller: phoneController,
                keyboardType: TextInputType.phone),
            const SizedBox(
              height: 24,
            ),
            ItemTaskTFF(
                label: "Password",
                hint: "Enter password",
                controller: passwordController,
                keyboardType: TextInputType.text,
                isObscure: true),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  FirebaseFunctions.createUserAccount(
                      emailController.text,
                      passwordController.text,
                      usernameController.text,
                      phoneController.text);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: MyTheme.primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "Register",
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: MyTheme.whiteColor),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
