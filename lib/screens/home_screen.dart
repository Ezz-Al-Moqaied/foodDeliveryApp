import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/screens/favorite_screen.dart';
import 'package:fooddeliveryapp/screens/report_screen.dart';
import 'package:fooddeliveryapp/screens/menu_screen.dart';

import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> Screens = [
    MenuScreen(),
    FavoriteScreen(),
    ReportsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screens[currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: const Duration(milliseconds: 400),
        animationCurve: Curves.easeInOut,
        backgroundColor: Colors.deepOrangeAccent,
        buttonBackgroundColor: Colors.deepOrangeAccent,
        index: currentIndex,
        items: const <Widget>[
          Icon(Icons.menu_outlined, size: 30),
          Icon(Icons.star, size: 30),
          Icon(Icons.report_outlined, size: 30),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
