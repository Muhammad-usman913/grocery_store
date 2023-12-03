import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_store/consts/theme_data.dart';
import 'package:grocery_store/provider/dark_theme_provider.dart';
import 'package:grocery_store/screens/home_screen.dart';
import 'package:provider/provider.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

 void getCurrentAppTheme()async{
   bool value = await themeChangeProvider.darkThemePrefs.getDarkTheme();
   themeChangeProvider.setDarkTheme(value);
 }
 @override
  void initState() {
   getCurrentAppTheme();

   super.initState();
  }



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) =>DarkThemeProvider()),
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context,themeProvider,child){
          return MaterialApp(
            title: 'Flutter Demo',
            theme: Style.themeData(themeProvider.getDarkTheme, context),
            home: HomeScreen(),
          );
        }
      ),
    );
  }
}
