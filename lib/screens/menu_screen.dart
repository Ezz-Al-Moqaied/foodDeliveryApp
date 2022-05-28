import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/model/FoodModel.dart';
import 'package:fooddeliveryapp/model/UserModel.dart';
import 'package:fooddeliveryapp/screens/home_screen.dart';
import 'package:fooddeliveryapp/widgets/item_food.dart';
import 'package:fooddeliveryapp/widgets/text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<FoodModel> list_food = [];
FirebaseFirestore firestore = FirebaseFirestore.instance;
late String id_user;
late String username;

class MenuScreen extends StatefulWidget {
  String username;

  MenuScreen({Key? key, required this.username}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState(username);
}

class _MenuScreenState extends State<MenuScreen> {
  var SearchController = TextEditingController();
  String username;

  _MenuScreenState(this.username);

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                  left: 30, right: 30, top: 40, bottom: 15),
              child: Row(
                children: const [
                  Text(
                    "Menu",
                    style:
                        TextStyle(color: Colors.deepOrangeAccent, fontSize: 30),
                  ),
                  Spacer(),
                  Icon(
                    Icons.menu,
                    size: 35,
                    color: Colors.deepOrangeAccent,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.only(left: 30),
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  const Text(
                    "Welcome ",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    "$username .. ",
                    style: const TextStyle(
                        fontSize: 25,
                        color: Colors.deepOrangeAccent,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      color: Colors.deepOrangeAccent,
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.only(right: 30),
                      child: const Text(
                        "logout",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Container(
              margin: EdgeInsets.all(15),
              child: TextFormField(
                controller: SearchController,
                decoration: const InputDecoration(
                  label: Text("Search food"),
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                onEditingComplete: () {
                  print(SearchController.text);
                },
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: FutureBuilder(
                builder: (context, projectSnap) {
                  if (projectSnap.connectionState == ConnectionState.none &&
                      projectSnap.hasData == null) {
                    //print('project snapshot data is: ${projectSnap.data}');
                    return Container();
                  }
                  return ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return defaultItemFood(
                            foodmodel: list_food[index], context: context);
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 18,
                        );
                      },
                      itemCount: list_food.length);
                },
                future: getAllFood(),
              ),
            ),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}

getAllFood() async {
  FoodModel foods;
  list_food.clear();
  await firestore.collection('foods').get().then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((food) {
      foods = FoodModel(
          id: food["id"],
          name: food["name"],
          image: food["image"],
          price: food["price"],
          favorite: food["favorite"],
          description: food["description"]);
      list_food.add(foods);
    });
  }).catchError((error) => print("Failed to get foods : $error"));
}
