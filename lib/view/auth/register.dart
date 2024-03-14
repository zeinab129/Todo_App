import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/firebase/firebase_functions.dart';
import 'package:todo_app/helper/helper.dart';
import 'package:todo_app/my_theme/my_theme.dart';
import 'package:todo_app/view/home/home_sceen.dart';

import '../widgets/item_task_tff.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              ItemTaskTFF(
                label: "Username",
                hint: "Enter user_name",
                controller: usernameController,
                keyboardType: TextInputType.name,
                validate: (value) {
                  if (value == null || value.isEmpty) {
                    return "UserName required";
                  }
                  if (!isValidUserName(value)) {
                    return "Please enter a valid userName!";
                  }
                },
              ),
              const SizedBox(
                height: 24,
              ),
              ItemTaskTFF(
                  label: "E-mail",
                  hint: "Enter e-mail",
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email required";
                    }
                    if (!isValidEmail(value)) {
                      return "Please enter a valid e-mail!";
                    }
                  }),
              const SizedBox(
                height: 24,
              ),
              ItemTaskTFF(
                  label: "Phone",
                  hint: "Enter phone number",
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return "Phone required";
                    }
                    if (!isValidPhone(value)) {
                      return "Please enter a valid phone!";
                    }
                  }),
              const SizedBox(
                height: 24,
              ),
              ItemTaskTFF(
                  label: "Password",
                  hint: "Enter password",
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  isObscure: true,
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password required";
                    }
                    if (!isValidPassword(value)) {
                      return "Please enter a valid password!";
                    }
                  }),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      FirebaseFunctions.createUserAccount(
                          email: emailController.text,
                          password: passwordController.text,
                          userName: usernameController.text,
                          phone: phoneController.text,
                          onError: (String errorMessage) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("Error Message"),
                                  content: Text(errorMessage),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Ok"))
                                  ],
                                );
                              },
                            );
                          },
                          onSuccess: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              HomeScreen.routeName,
                              (route) => false,
                            );
                          });
                    }
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
      ),
    );
  }
}
