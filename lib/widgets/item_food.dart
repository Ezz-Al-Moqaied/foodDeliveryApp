import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/model/FoodModel.dart';
import 'package:fooddeliveryapp/screens/details_screen.dart';

Widget defaultItemFood({
  required BuildContext context ,
  required FoodModel foodmodel,
}) =>
    GestureDetector(
      onTap: (){
        navigator(context, DetailsScreen(foodmodel));
      },
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 60, right: 10),
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                border: Border.all(color: Colors.white),
            ),
            child: Row(
              children: [
                const SizedBox(width: 60),
                Column(
                  children: [
                    const SizedBox(height: 15),
                    Text(foodmodel.name!,
                        style:
                            const TextStyle(fontSize: 25, color: Colors.black)),
                    const Spacer(),
                    Text(foodmodel.price!.toString(),
                        style:
                            const TextStyle(fontSize: 20, color: Colors.black)),
                    const SizedBox(height: 15),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    const SizedBox(height: 10),
                    GestureDetector(
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            color: Colors.deepOrangeAccent),
                        child: const Icon(Icons.add),
                        width: 35,
                        height: 35,
                      ),
                      onTap: () {
                        print("click");
                      },
                    ),
                    const Spacer(),
                    GestureDetector(
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30))),
                        child:
                        foodmodel.favorite == true ? const Icon(Icons.favorite , size: 30 , color: Colors.deepOrangeAccent) :
                        const Icon(Icons.favorite_border , size: 30 , color: Colors.deepOrangeAccent),
                        width: 35,
                        height: 35,
                      ),
                      onTap: () {
                        print("click");
                      },
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
                const SizedBox(width: 20),
              ],
            ),
          ),
          Container(
            child: Image.asset(
              foodmodel.image!,
              width: 110,
              height: 100,
            ),
          ),
        ],
      ),
    );


void navigator(context, widget) => Navigator.push(
    context, MaterialPageRoute(builder: (context) => widget));
