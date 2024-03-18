import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/firebase_options.dart';
import 'package:todo_app/my_theme/my_theme.dart';
import 'package:todo_app/providers/my_provider.dart';
import 'package:todo_app/view/auth/auth.dart';
import 'package:todo_app/view/home/home_sceen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  MyProvider myProvider = MyProvider();
  await myProvider.setItems();
  runApp(
      ChangeNotifierProvider(
      create: (context) => myProvider, child: EasyLocalization(
          supportedLocales: const [Locale('en'), Locale('ar')],
          path: 'assets/translations', // <-- change the path of the translation files
          fallbackLocale: const Locale('en'),
          saveLocale: true,
          child: const MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: provider.themeMode,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: provider.firebaseUser != null? HomeScreen.routeName: AuthScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        AuthScreen.routeName: (context) => const AuthScreen(),
      },
    );
  }
}
