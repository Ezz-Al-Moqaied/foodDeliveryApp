import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/model/FoodModel.dart';
import 'package:fooddeliveryapp/model/UserModel.dart';
import 'package:fooddeliveryapp/screens/favorite_screen.dart';
import 'package:fooddeliveryapp/screens/login_screen.dart';
import 'package:fooddeliveryapp/screens/report_screen.dart';
import 'package:fooddeliveryapp/screens/menu_screen.dart';

late List<FoodModel> list_food;
class HomeScreen extends StatefulWidget {

   UserModel users ;

  HomeScreen({Key? key , required this.users}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState(users);
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Widget> Screens ;
  int currentIndex = 0;
  final UserModel model ;
  _HomeScreenState(this.model);

  @override
  void initState() {
    print("a1");
    print(model.favorites?.length);
    List<int>? intList = model.favorites?.map((s) => s as int).toList();
    print("a2");
    print(intList?.length);

    super.initState();
    Screens = [
      MenuScreen(username: model.name!),
      FavoriteScreen(favorites: intList!),
      ReportsScreen(),
    ];
  }




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