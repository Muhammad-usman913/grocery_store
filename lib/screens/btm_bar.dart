import 'package:flutter/material.dart';
import 'package:grocery_store/screens/cart.dart';
import 'package:grocery_store/screens/category.dart';
import 'package:grocery_store/screens/home_screen.dart';
import 'package:grocery_store/screens/user.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';



class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {

  int _selectedIndex = 0;
  final _pages = [
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    UserScreen()

  ];
  // final appBarList = [
  //   AppBar(title: Text("Home Screen1"),),
  //   AppBar(title: Text("Category Screen1"),),
  //   AppBar(title: Text("Cart Screen1"),),
  //   AppBar(title: Text("User Screen1"),),
  // ];
  @override
  Widget build(BuildContext context) {
    DarkThemeProvider darkThemeProvider = Provider.of<DarkThemeProvider>(context,listen: false);
    bool _isDark = darkThemeProvider.getDarkTheme;

    return Scaffold(
      // appBar: appBarList.elementAt(_selectedIndex),
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: _isDark ? Theme.of(context).cardColor : Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
      icon: _selectedIndex == 0 ? Icon(IconlyBold.home) :  Icon(IconlyLight.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: _selectedIndex == 1 ? Icon(IconlyBold.category) : Icon(IconlyLight.category), label: 'Categories'),
          BottomNavigationBarItem(
              icon: _selectedIndex == 2 ? Icon(IconlyBold.buy): Icon(IconlyLight.buy), label: 'Cart'),
          BottomNavigationBarItem(
              icon: _selectedIndex == 3 ? Icon(IconlyBold.user2) : Icon(IconlyLight.user2), label: 'User'),
        ],
        currentIndex: _selectedIndex,
        onTap: onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: _isDark ?  Colors.white10 : Colors.black12,
        selectedItemColor: _isDark ? Colors.lightBlue.shade200 : Colors.black87,
      ),
    );
  }
  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

}
