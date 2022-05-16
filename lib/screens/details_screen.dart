import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/model/FoodModel.dart';

class DetailsScreen extends StatelessWidget {
  late FoodModel foodModel;
  DetailsScreen(this.foodModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    width: double.infinity,
                    height: 285,
                    child: Image.asset(
                      foodModel.image!,
                      width: 150,
                      height: 150,
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 280),
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              color: Colors.white),
                          width: double.infinity,
                          height: 300,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 15, top: 40),
                                child: Text(
                                  foodModel.name!,
                                  style: const TextStyle(fontSize: 25 , fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 15, top: 20),
                                child: Text(
                                   foodModel.price.toString(),
                                  style: const TextStyle(fontSize: 20 ,fontWeight: FontWeight.bold),
                                ),
                              ),

                              Container(
                                margin: const EdgeInsets.only(left: 15, top: 10),
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.star,
                                      color: Colors.deepOrangeAccent,
                                    ),
                                    Icon(Icons.star,
                                        color: Colors.deepOrangeAccent),
                                    Icon(Icons.star,
                                        color: Colors.deepOrangeAccent),
                                    Icon(Icons.star,
                                        color: Colors.deepOrangeAccent),
                                    Icon(Icons.star_border),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 20, top: 10),
                                child: const Text(
                                  "4 Star Ratings",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 20, top: 30),
                                child: const Text(
                                  "Description",
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                              ),

                              Container(
                                margin: const EdgeInsets.only(
                                    left: 20, top: 15, right: 20),
                                child: Text(
                                  foodModel.description!,
                                  style: const TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(right: 20),
                          width: 75,
                          height: 75,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          image: DecorationImage(
                            image: AssetImage("images/shape.png"),
                            fit: BoxFit.cover,
                          ),
                          ),
                          child: foodModel.favorite == true ?
                          IconButton(icon: const Icon(Icons.favorite , color: Colors.deepOrange, size: 30),
                            onPressed: () {
                            print(true);
                          }) :
                          IconButton(icon: const Icon(Icons.favorite_border , color: Colors.deepOrange, size: 30),
                            onPressed: () {
                              print(false);
                            } ,
                          )
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
