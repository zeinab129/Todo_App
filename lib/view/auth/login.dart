import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/firebase/firebase_functions.dart';
import 'package:todo_app/helper/helper.dart';
import 'package:todo_app/my_theme/my_theme.dart';
import 'package:todo_app/view/home/home_sceen.dart';
import 'package:todo_app/view/widgets/item_task_tff.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController emailController = TextEditingController();
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
                  label: "E-mail",
                  hint: "Enter e-mail",
                  controller: TextEditingController(),
                  keyboardType: TextInputType.emailAddress,
                  validate: (value) {
                    if (value.isEmpty || value == null) {
                      return "Email required!";
                    }
                    if (!isValidEmail(value)) {
                      return "Please enter a valid email!";
                    }
                  }),
              const SizedBox(
                height: 24,
              ),
              ItemTaskTFF(
                  label: "Password",
                  hint: "Enter password",
                  controller: TextEditingController(),
                  keyboardType: TextInputType.text,
                  isObscure: true,
                  validate: (String value) {
                    if (value.isEmpty || value == null) {
                      return "Password required!";
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
                        FirebaseFunctions.login(
                            email: emailController.text,
                            password: passwordController.text,
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
      ),
    );
  }
}
