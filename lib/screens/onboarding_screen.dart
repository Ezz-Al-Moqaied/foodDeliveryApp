import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/model/BoardingModel.dart';
import 'package:fooddeliveryapp/screens/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => OnBoardingScreenState();
}

var boardController = PageController();
List<BoardingModel> boarding = [
  BoardingModel(
      image: 'images/Boarding_img1.png',
      title: 'Find Food You Love',
      body:
          'Discover the best foods from over 1,000 restaurants and fast delivery to your doorstep'),
  BoardingModel(
    image: 'images/Boarding_img2.png',
    title: 'Fast Delivery',
    body: 'Fast food delivery to your home, office wherever you are',
  ),
  BoardingModel(
    image: 'images/Boarding_img3.png',
    title: 'Live Tracking',
    body:
        'Real time tracking of your food on the app once you placed the order',
  ),
];

class OnBoardingScreenState extends State<OnBoardingScreen> {
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        actions: [
          TextButton(
            child: const Text(
              "skip",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            onPressed: () {
              navigateNext(context, LoginScreen());
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                itemBuilder: (context, index) => boardingItem(boarding[index]),
                itemCount: boarding.length,
                physics: const BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                }),
          ),
          const SizedBox(height: 20),
          SmoothPageIndicator(
            controller: boardController,
            count: boarding.length,
            effect: const SwapEffect(
              dotColor: Colors.black26,
              activeDotColor: Colors.deepOrangeAccent,
              dotHeight: 11,
              dotWidth: 12,
              spacing: 3,
              type: SwapType.yRotation,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 30, right: 30, top: 60),
            alignment: Alignment.topRight,
            child: FloatingActionButton(
              backgroundColor: Colors.deepOrangeAccent,
                child: const Icon(Icons.arrow_forward_ios , color: Colors.white,),
                onPressed: () {
                  if (isLast) {
                    navigateNext(context, LoginScreen());
                  } else {
                    boardController.nextPage(
                      duration: const Duration(
                        milliseconds: 750,
                      ),
                      curve: Curves.fastLinearToSlowEaseIn,
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}

Widget boardingItem(BoardingModel model) => Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Image(
            image: AssetImage('${model.image}'),
          ),
        ),
        Text(
          '${model.title}',
          style: const TextStyle(
            fontSize: 24.0,
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            '${model.body}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14.0,
            ),
          ),
        ),
        const SizedBox(
          height: 30.0,
        ),
      ],
    );

void navigateNext(context, widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => widget), (route) => false);

void submit(context, widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => widget), (route) => false);