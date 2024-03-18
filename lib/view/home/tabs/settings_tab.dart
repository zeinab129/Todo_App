import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/my_theme/my_theme.dart';
import 'package:todo_app/providers/my_provider.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    String selectedLanguage = provider.languageCode;
    String selectedTheme = provider.isLightMood()? "light": "dark";
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "language".tr(),
            style: GoogleFonts.poppins(
                color: provider.isLightMood()
                    ? MyTheme.blackColor
                    : MyTheme.whiteColor,
                fontWeight: FontWeight.w600,
                fontSize: 18),
          ),
          const SizedBox(height: 12,),
          DropdownButtonFormField(
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 2),
                borderRadius: BorderRadius.circular(8),
              )
            ),
            value: selectedLanguage,
            items: [
              DropdownMenuItem(
                value: "en",
                child: Text("english".tr()),
              ),
              DropdownMenuItem(
                value: "ar",
                child: Text("arabic".tr()),
              )
            ],
            onChanged: (String? lang) {
              provider.changeLanguage(lang ?? "en");
              context.setLocale(Locale(provider.languageCode));
              print(provider.languageCode);
            },
          ),
          const SizedBox(height: 24,),
          Text("mode".tr(),
              style: GoogleFonts.poppins(
                color: provider.isLightMood()
                    ? MyTheme.blackColor
                    : MyTheme.whiteColor,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              )),
          const SizedBox(height: 12,),
          DropdownButtonFormField(
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 2),
                  borderRadius: BorderRadius.circular(8),
                )
            ),
            value: selectedTheme,
            items: [
              DropdownMenuItem(
                value: "light",
                child: Text("light".tr()),
              ),
              DropdownMenuItem(
                value: "dark",
                child: Text("dark".tr()),
              )
            ],
            onChanged: (String? theme) {
              provider.changeTheme(theme=="light"? ThemeMode.light: ThemeMode.dark);
            },
          )
        ],
      ),
    );
  }
}
