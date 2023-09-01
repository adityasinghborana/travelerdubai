import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:travelerdubai/service/auth.dart';
import 'package:travelerdubai/view/screens/homescreen.dart';
import 'package:travelerdubai/view/screens/panel.dart';

class SignupController extends GetxController {
  final AuthClass authClass = AuthClass();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void signUp() async {
    try {
      await firebase_auth.FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Get.toNamed('/panel');
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
