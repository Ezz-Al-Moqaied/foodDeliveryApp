import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/model/UserModel.dart';
import 'package:fooddeliveryapp/screens/login_screen.dart';
import 'package:fooddeliveryapp/widgets/text_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(20.0),
          margin: const EdgeInsets.only(top: 100),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Sign Up",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                "Add your details to sign up",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 30),
              defaultTextField(
                  keyboardType: TextInputType.name,
                  controller: nameController,
                  label: 'Name',
                  prefixIcon: Icons.person),
              const SizedBox(height: 15),
              defaultTextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  label: 'Email',
                  prefixIcon: Icons.email),
              const SizedBox(height: 15),
              defaultTextField(
                  keyboardType: TextInputType.phone,
                  controller: phoneController,
                  label: 'phone number',
                  prefixIcon: Icons.phone),
              const SizedBox(height: 15),
              defaultTextField(
                  keyboardType: TextInputType.text,
                  controller: addressController,
                  label: 'Address',
                  prefixIcon: Icons.place),
              const SizedBox(height: 15),
              defaultTextField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordController,
                  label: 'Password',
                  prefixIcon: Icons.lock,
                  suffix: Icons.remove_red_eye),
              const SizedBox(height: 15),
              defaultTextField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: confirmController,
                  label: 'Confirm Password',
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
                    AddUser(UserModel(
                        name: nameController.text,
                        email: emailController.text,
                        phone: int.parse(phoneController.text),
                        address: addressController.text,
                        password: passwordController.text,
                        confirmpassword: confirmController.text));
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an Account? ",
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
                      "Login",
                      style: TextStyle(
                        color: Colors.deepOrangeAccent,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      navigator(context, LoginScreen());

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

void navigator(context, widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => widget), (route) => false);



Future AddUser(UserModel user) async {
  if (user.password == user.confirmpassword) {
    FirebaseFirestore.instance
        .collection("users")
        .add({
          "name": user.name,
          "email": user.email,
          "phone": user.phone,
          "address": user.address,
          "password": user.password,
          "favorites": user.favorites
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  } else {
    print("Failed Password .. ");
  }
}
