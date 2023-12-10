import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_store/consts/theme_data.dart';
import 'package:grocery_store/inner_screen/on_sale_screen.dart';
import 'package:grocery_store/provider/dark_theme_provider.dart';
import 'package:grocery_store/screens/btm_bar.dart';
import 'package:grocery_store/screens/home_screen.dart';
import 'package:provider/provider.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) {
    runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) =>DarkThemeProvider()),
        ],
        child: new MyApp()));
  });
}

class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

 @override
  void initState() {
   getCurrentAppTheme();
   super.initState();
  }
 void getCurrentAppTheme()async{
   DarkThemeProvider darkThemeProvider = Provider.of<DarkThemeProvider>(context,listen: false);
   bool value = await darkThemeProvider.darkThemePrefs.getDarkTheme();
   darkThemeProvider.setDarkTheme(value);
 }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<DarkThemeProvider>(
        builder: (context,themeProvider,child){
          return MaterialApp(
            title: 'Flutter Demo',
            theme: Style.themeData(themeProvider.getDarkTheme, context),
            home: BottomBarScreen(),
            routes: {
              OnSaleScreen.routeName :(ctx) => OnSaleScreen()
            },
          );
        }
    );
  }
}
