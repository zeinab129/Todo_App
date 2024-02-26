import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/my_theme/my_theme.dart';
import 'package:todo_app/providers/my_provider.dart';
import 'package:todo_app/view/widgets/item_task.dart';

class TasksTab extends StatelessWidget {
  const TasksTab({super.key});

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
            initialSelectedDate: DateTime.now(),
            selectionColor: MyTheme.primaryColor,
            selectedTextColor: MyTheme.whiteColor,
            daysCount: 365,
            locale: "en",
            height: MediaQuery.of(context).size.height * 0.12,
            onDateChange: (date) {
              // New date selected
              // setState(() {
              //   _selectedValue = date;
              // });
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return const ItemTask();
                },
                itemCount: 10,
              ),
            ),
          )
        ],
      ),
    );
  }
}
