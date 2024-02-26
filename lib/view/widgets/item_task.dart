import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/my_theme/my_theme.dart';

import '../../providers/my_provider.dart';

class ItemTask extends StatelessWidget {
  const ItemTask({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: provider.isLightMood()
              ? MyTheme.whiteColor
              : MyTheme.darkSecondBgColor),
      child: Slidable(
        startActionPane: ActionPane(motion: const DrawerMotion(), children: [
          SlidableAction(
            onPressed: (context) {},
            label: "Delete",
            backgroundColor: MyTheme.redColor,
            icon: Icons.delete,
            autoClose: true,
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16), topLeft: Radius.circular(16)),
          ),
          SlidableAction(
            onPressed: (context) {},
            label: "Edit",
            backgroundColor: MyTheme.primaryColor,
            icon: Icons.edit,
            autoClose: true,
          ),
        ]),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            children: [
              Container(
                height: 64,
                width: 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: MyTheme.primaryColor,
                ),
              ),
              const SizedBox(
                width: 24,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Play basket ball",
                      style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: MyTheme.primaryColor),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time_rounded,
                          size: 24,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          "10:30 AM",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: provider.isLightMood()
                                  ? MyTheme.blackColor
                                  : MyTheme.whiteColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2),
                  decoration: BoxDecoration(
                      color: MyTheme.primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Icon(
                    Icons.done,
                    color: MyTheme.whiteColor,
                    size: 24,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
