import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_store/consts/theme_data.dart';
import 'package:grocery_store/screens/home_screen.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bool _isDark = false;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Style.themeData(true, context),
      home: HomeScreen(),
    );
  }
}
