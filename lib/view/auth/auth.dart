import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/my_theme/my_theme.dart';
import 'package:todo_app/view/auth/login.dart';
import 'package:todo_app/view/auth/register.dart';

class AuthScreen extends StatelessWidget {
  static const String routeName = "AUTH_SCREEN";

  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text(
            "login".tr(),
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w700, fontSize: 24, color: Colors.white),
          ),
          centerTitle: true,
          bottom: TabBar(
            unselectedLabelColor: MyTheme.greyColor,
            indicatorColor: MyTheme.whiteColor,
            indicatorPadding: const EdgeInsets.only(bottom: 2),
            tabs: [
              Tab(
                child: Text(
                  "login".tr(),
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
              Tab(
                child: Text(
                  "reg".tr(),
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            LoginScreen(),
            RegisterScreen()
          ],
        ),
      ),
    );
  }
}
