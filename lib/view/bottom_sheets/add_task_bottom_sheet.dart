import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/firebase/firebase_functions.dart';
import 'package:todo_app/helper/helper.dart';
import 'package:todo_app/model/task_model.dart';
import 'package:todo_app/my_theme/my_theme.dart';
import 'package:todo_app/providers/my_provider.dart';
import 'package:todo_app/view/widgets/item_task_tff.dart';

class AddTaskBottomSheet extends StatefulWidget {
  bool edit;
  TaskModel? taskModel;

  AddTaskBottomSheet({super.key, required this.edit, this.taskModel});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  DateTime chosenDate = DateTime.now();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  @override
  void initState() {
    if (widget.edit) {
      titleController.text = widget.taskModel!.title ?? "";
      descriptionController.text = widget.taskModel!.description ?? "";
      chosenDate =
          DateTime.fromMillisecondsSinceEpoch(widget.taskModel!.date ?? 0);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.edit ? "edit_task".tr() : "add_new_task".tr(),
            style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: provider.isLightMood()
                    ? MyTheme.blackColor
                    : MyTheme.whiteColor),
          ),
          const SizedBox(
            height: 12,
          ),
          ItemTaskTFF(
            label: "title".tr(),
            hint: "enter_task_title".tr(),
            controller: titleController,
            validate: (value) {
              if (value.isEmpty || value == null) {
                return "title_required".tr();
              }
              if(value.length < 4 || value.length > 10){
                return "title_length".tr();
              }
              if (!isValidTaskTitle(value)) {
                return "enter_valid_title".tr();
              }
            },
          ),
          const SizedBox(
            height: 24,
          ),
          ItemTaskTFF(
              label: "desc".tr(),
              hint: "enter_task_desc".tr(),
              controller: descriptionController,
              validate: (value) {
                if (value.isEmpty || value == null) {
                  return "desc_required".tr();
                }
                if(value.length<15 || value.length > 30){
                  return "desc_length".tr();
                }
                if (!isValidTaskDesc(value)) {
                  return "enter_valid_desc".tr();
                }
              }),
          const SizedBox(
            height: 24,
          ),
          Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              child: Text(
                "select_date".tr(),
                style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: provider.isLightMood()
                        ? MyTheme.blackColor
                        : MyTheme.whiteColor),
              )),
          const SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: () {
              selectDate(context, provider);
            },
            child: Text(
              chosenDate.toString().substring(0, 10),
              style: GoogleFonts.poppins(
                  fontSize: 32,
                  fontWeight: FontWeight.w100,
                  color: provider.isLightMood()
                      ? MyTheme.blackColor
                      : MyTheme.whiteColor),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: widget.edit
                  ? () {
                      TaskModel model = TaskModel(
                          isDone: widget.taskModel!.isDone,
                          id: widget.taskModel!.id,
                          title: titleController.text,
                          description: descriptionController.text,
                          date: DateUtils.dateOnly(chosenDate)
                              .millisecondsSinceEpoch,
                          userId: FirebaseAuth.instance.currentUser!.uid);
                      FirebaseFunctions.updateTask(model);
                      Navigator.pop(context);
                    }
                  : () {
                      TaskModel model = TaskModel(
                          title: titleController.text,
                          description: descriptionController.text,
                          date: DateUtils.dateOnly(chosenDate)
                              .millisecondsSinceEpoch,
                          userId: FirebaseAuth.instance.currentUser!.uid);
                      FirebaseFunctions.addTask(model);
                      Navigator.pop(context);
                    },
              style: ElevatedButton.styleFrom(
                  backgroundColor: MyTheme.primaryColor),
              child: Text(
                widget.edit ? "edit_task".tr() : "add_task".tr(),
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: MyTheme.whiteColor),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> selectDate(BuildContext context, MyProvider provider) async {
    DateTime? selectedDate = await showDatePicker(
      locale: Locale(provider.languageCode),
      context: context,
      initialDate: chosenDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      selectableDayPredicate: (day) =>
          day != DateTime.now().add(const Duration(days: 2)),
      builder: (context, child) {
        return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: provider.isLightMood()
                  ? const ColorScheme.light(
                      primary: MyTheme.primaryColor, surface: MyTheme.bgColor)
                  : const ColorScheme.dark(
                      primary: MyTheme.primaryColor,
                      surface: MyTheme.darkBgColor),
            ),
            child: child!);
      },
    );
    if (selectedDate != null) {
      chosenDate = selectedDate;
    }
    setState(() {});
  }
}
