import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/model/FoodModel.dart';
import 'package:fooddeliveryapp/widgets/item_food.dart';
import 'package:fooddeliveryapp/widgets/text_field.dart';

class MenuScreen extends StatelessWidget {
  var SearchController = TextEditingController();

  MenuScreen({Key? key}) : super(key: key);

  List<FoodModel> menu = [
    FoodModel(
        name: "Cheeseburger",
        price: 10.0,
        description: "Cheese burger ... ",
        image: "images/Cheeseburger.jpg",
        favorite: true),
    FoodModel(
        name: "Fillet steak",
        price: 19.0,
        description: "Fillet steak ... ",
        image: "images/Filletsteak.jpg",
        favorite: true),
    FoodModel(
        name: "Chicken",
        price: 20.5,
        description: "Chicken ... ",
        image: "images/Chicken.jpg",
        favorite: true),
    FoodModel(
        name: "Fried fish",
        price: 30.0,
        description: "Fried fish ... ",
        image: "images/Friedfish.jpg",
        favorite: false),
    FoodModel(
        name: "Pizza",
        price: 11.0,
        description: "Pizza ... ",
        image: "images/Pizza.jpg",
        favorite: true),
    FoodModel(
        name: "Orange Juice",
        price: 5.0,
        description: "Orange Juice ... ",
        image: "images/OrangeJuice.jpg",
        favorite: true),
    FoodModel(
        name: "Soda",
        price: 4.5,
        description: "Soda All kinds of foods ... ",
        image: "images/Soda.jpg",
        favorite: true),
    FoodModel(
        name: "Chocolate pie",
        price: 8.0,
        description: "Chocolate pie ... ",
        image: "images/Chocolatepie.jpg",
        favorite: false),
  ];

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
                  const Text(
                    "Ezz .. ",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.deepOrangeAccent,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      // Log out the account
                    },
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
              margin: const EdgeInsets.all(15),
              child: defaultTextField(
                  controller: SearchController,
                  label: "Search food",
                  prefixIcon: Icons.search),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return defaultItemFood(
                        foodmodel: menu[index],
                    context: context);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 18,
                    );
                  },
                  itemCount: menu.length),
            ),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
