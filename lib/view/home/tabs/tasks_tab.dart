import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/firebase/firebase_functions.dart';
import 'package:todo_app/model/task_model.dart';
import 'package:todo_app/my_theme/my_theme.dart';
import 'package:todo_app/providers/my_provider.dart';
import 'package:todo_app/view/widgets/item_task.dart';

class TasksTab extends StatefulWidget {
  TasksTab({super.key});

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          DatePicker(
            DateTime.now(),
            dateTextStyle: TextStyle(
                color: provider.isLightMood()
                    ? MyTheme.blackColor
                    : MyTheme.whiteColor),
            dayTextStyle: TextStyle(
                color: provider.isLightMood()
                    ? MyTheme.blackColor
                    : MyTheme.whiteColor),
            monthTextStyle: TextStyle(
                color: provider.isLightMood()
                    ? MyTheme.blackColor
                    : MyTheme.whiteColor),
            initialSelectedDate: selectedDate,
            selectionColor: MyTheme.primaryColor,
            selectedTextColor: MyTheme.whiteColor,
            daysCount: 365,
            locale: provider.languageCode,
            height: MediaQuery.of(context).size.height * 0.12,
            onDateChange: (date) {
              selectedDate = date;
              setState(() {});
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: StreamBuilder<QuerySnapshot<TaskModel>>(
                stream: FirebaseFunctions.getTasks(selectedDate),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("error_has_occurred".tr()),
                    );
                  }
                  var tasks =
                      snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
                  if (tasks.isEmpty) {
                    return Center(
                      child: Text("no_tasks_added".tr()),
                    );
                  }
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return ItemTask(
                        taskModel: tasks[index],
                      );
                    },
                    itemCount: tasks.length,
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
