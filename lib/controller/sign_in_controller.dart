import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/service/auth.dart';
import 'package:travelerdubai/view/screens/auth/signup.dart';
import 'package:travelerdubai/dashboard.dart';

class SigninController extends GetxController {
  final firebase_auth.FirebaseAuth firebaseAuth =
      firebase_auth.FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthClass authClass = AuthClass();

  Future<void> signIn() async {
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      print(userCredential.user?.uid);

      Get.offAll(() => Dashboard());
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  void goToSignUp() {
    Get.to(() => SignupPage());
  }
}
