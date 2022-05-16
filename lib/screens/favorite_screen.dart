import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/model/FoodModel.dart';
import 'package:fooddeliveryapp/widgets/item_food.dart';
import 'package:fooddeliveryapp/widgets/text_field.dart';

class FavoriteScreen extends StatelessWidget {
  var SearchController = TextEditingController();

  FavoriteScreen({Key? key}) : super(key: key);

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
                    "Favorite",
                    style:
                    TextStyle(color: Colors.deepOrangeAccent, fontSize: 30),
                  ),
                  Spacer(),
                  Icon(
                    Icons.star,
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
                children: const [
                  Text("Welcome "  ,style:  TextStyle(
                    fontSize: 25 ,
                  ),
                  ),
                  Text("Ezz .. "  ,style:  TextStyle(
                      fontSize: 25 ,
                      color: Colors.deepOrangeAccent,
                      fontWeight: FontWeight.bold
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
