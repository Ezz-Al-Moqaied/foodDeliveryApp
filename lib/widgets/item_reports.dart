import 'package:flutter/material.dart';

Widget defaultItemReports({
  required String today,
  required String date,
  required String total,
}) =>
    Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 25 , right: 25 , top: 40),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              border: Border.all(color: Colors.deepOrangeAccent)
          ),
          child: Row(
            children: const [
              Text(
                "Sat",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Text("12/12/2022" , style: TextStyle(
                fontSize: 25 ,
              ),)
            ],
          ),
        ),
        const SizedBox(height: 5,),
        Container(
          margin: const EdgeInsets.only(left: 60 , right: 60),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              border: Border.all(color: Colors.deepOrangeAccent)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Total : 65",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
         Container(
           margin: const EdgeInsets.only(left: 15 , right: 15),
           child: const Divider(
            color: Colors.deepOrangeAccent,
            thickness: 3,
        ),
         ),
      ],
    );
