import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          "To Do List",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700, fontSize: 24, color: Colors.white),
        ),
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
                  child: const AddTaskBottomSheet());
            },
          );
        },
        child: const Icon(
          CupertinoIcons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
      bottomNavigationBar: Stack(
        children: [
          BottomAppBar(
            notchMargin: 8,
            child: Container(),
          ),
          BottomNavigationBar(
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
          )
        ],
      ),
    );
  }

  List<Widget> tabs = [const TasksTab(), const SettingsTab()];
}
