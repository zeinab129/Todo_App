import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
            "Login",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w700, fontSize: 24, color: Colors.white),
          ),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text(
                  "Login",
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
              Tab(
                child: Text(
                  "Register",
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
