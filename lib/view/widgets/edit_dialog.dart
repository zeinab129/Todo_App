import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/my_theme/my_theme.dart';
import 'package:todo_app/providers/my_provider.dart';

class EditDialog extends StatelessWidget {
  const EditDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      margin: EdgeInsets.all(48),
      decoration: BoxDecoration(color: MyTheme.whiteColor),
      child: Column(
        children: [
          Text(
            "Edit Task",
            style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: provider.isLightMood()
                    ? MyTheme.blackColor
                    : MyTheme.whiteColor),
          )
        ],
      ),
    );
  }
}
