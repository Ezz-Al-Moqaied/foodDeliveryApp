import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/model/FoodModel.dart';
import 'package:fooddeliveryapp/widgets/item_food.dart';
import 'package:fooddeliveryapp/widgets/text_field.dart';

List<FoodModel> list_food = [];
FirebaseFirestore firestore = FirebaseFirestore.instance;
List<int> id_favorite = [1, 2, 4, 5, 8];

class FavoriteScreen extends StatefulWidget {
  List<int> favorites ;

  FavoriteScreen({Key? key, required this.favorites}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState(favorites);
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  var SearchController = TextEditingController();

  late List<int> favorites ;

  @override
  void initState() {
    super.initState();
  }

  _FavoriteScreenState(List<int> favorites);


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
                  Text(
                    "Welcome ",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    "Ezz .. ",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.deepOrangeAccent,
                        fontWeight: FontWeight.bold),
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
      id_favorite.forEach((index) {
        if (index == food["id"]) {
          foods.favorite = true;
          list_food.add(foods);
        }
      });
    });
  }).catchError((error) => print("Failed to get foods : $error"));
}
