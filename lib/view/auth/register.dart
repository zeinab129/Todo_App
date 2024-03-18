import 'package:easy_localization/easy_localization.dart';
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
                label: "user_name".tr(),
                hint: "enter_username".tr(),
                controller: usernameController,
                keyboardType: TextInputType.name,
                validate: (value) {
                  if (value == null || value.isEmpty) {
                    return "username_required".tr();
                  }
                  if(value.length <3 || value.length > 10){
                    return "username_length".tr();
                  }
                  if (!isValidUserName(value)) {
                    return "enter_valid_username".tr();
                  }
                },
              ),
              const SizedBox(
                height: 24,
              ),
              ItemTaskTFF(
                  label: "email".tr(),
                  hint: "enter_email".tr(),
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return "email_required".tr();
                    }
                    if (!isValidEmail(value)) {
                      return "enter_valid_email".tr();
                    }
                  }),
              const SizedBox(
                height: 24,
              ),
              ItemTaskTFF(
                  label: "phone".tr(),
                  hint: "enter_phone_num".tr(),
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return "phone_required".tr();
                    }
                    if (!isValidPhone(value)) {
                      return "enter_valid_phone".tr();
                    }
                  }),
              const SizedBox(
                height: 24,
              ),
              ItemTaskTFF(
                  label: "pass".tr(),
                  hint: "enter_pass".tr(),
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  isObscure: true,
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return "pass_required".tr();
                    }
                    if (value.length < 6|| value.length > 10){
                      return "pass_length".tr();
                    }
                    if (!isValidPassword(value)) {
                      return "enter_valid_pass".tr();
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
                                  title: Text("error_msg".tr()),
                                  content: Text(errorMessage),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("ok".tr()))
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
                      "reg".tr(),
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
