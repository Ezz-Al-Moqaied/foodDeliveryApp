import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/model/UserModel.dart';
import 'package:fooddeliveryapp/screens/home_screen.dart';
import 'package:fooddeliveryapp/screens/sign_up_screen.dart';
import 'package:fooddeliveryapp/widgets/text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

var emailController = TextEditingController();
var passwordController = TextEditingController();
late UserModel users;
late String ID_users;

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20.0),
          margin: const EdgeInsets.only(top: 100),
          child: Column(
            children: [
              const Text(
                "Login",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                "Add your details to login",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 30),
              defaultTextField(
                  controller: emailController,
                  label: 'Email',
                  prefixIcon: Icons.email,
                  keyboardType: TextInputType.emailAddress),
              const SizedBox(height: 15),
              defaultTextField(
                  controller: passwordController,
                  label: 'Password',
                  keyboardType: TextInputType.visiblePassword,
                  prefixIcon: Icons.lock,
                  suffix: Icons.remove_red_eye),
              Container(
                margin: const EdgeInsets.only(top: 20),
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                decoration: const BoxDecoration(
                    color: Colors.deepOrangeAccent,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: MaterialButton(
                  onPressed: () {
                    getUser(context);
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                  margin: const EdgeInsets.only(right: 20),
                  width: double.infinity,
                  child: const Text(
                    "Forgot your password ?",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                  )),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an Account ? ",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  GestureDetector(
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.deepOrangeAccent,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      print("sign up");
                      navigateNext(context, SignUpScreen());
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

void navigateNext(context, widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => widget), (route) => false);

Future<UserModel> getUser(context) async {
  FirebaseFirestore.instance
      .collection('users')
      .get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((user) {
      if (user["email"] == emailController.text &&
          user["password"] == passwordController.text) {
        users = UserModel(
            name: user["name"],
            email: user["email"],
            phone: user["phone"],
            address: user["address"],
            password: user["password"],
            confirmpassword: user["password"],
            favorites: user["favorites"]);
        navigateNext(context, HomeScreen(users: users));
      } else {}
    });
  }).catchError((error) => print("Failed to add user: $error"));
  return users;
}


