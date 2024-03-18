import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/firebase/firebase_functions.dart';
import 'package:todo_app/providers/my_provider.dart';
import 'package:todo_app/view/auth/auth.dart';
import 'package:todo_app/view/bottom_sheets/add_task_bottom_sheet.dart';
import 'package:todo_app/view/home/tabs/settings_tab.dart';
import 'package:todo_app/view/home/tabs/tasks_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HOME_SCREEN";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(
          "todo_list".tr(),
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700, fontSize: 24, color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextButton(
                onPressed: () {
                  FirebaseFunctions.signOut();
                  Navigator.pushNamedAndRemoveUntil(context, AuthScreen.routeName, (route) => false,);
                },
                child: const Icon(
                  Icons.logout, color: Colors.white,
                )),
          )
        ],
      ),
      body: tabs[index],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddTaskBottomSheet(
                    edit: false,
                  ));
            },
          );
        },
        child: const Icon(
          CupertinoIcons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          notchMargin: 8,
          padding: const EdgeInsets.all(0.0),
          child: BottomNavigationBar(
            currentIndex: index,
            onTap: (value) {
              index = value;
              setState(() {});
            },
            iconSize: 32,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.list_bullet), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.gear), label: "")
            ],
          )),
    );
  }

  List<Widget> tabs = [TasksTab(), const SettingsTab()];
}
