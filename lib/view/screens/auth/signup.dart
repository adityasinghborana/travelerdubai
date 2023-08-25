import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/controller/sign_up_controller.dart';
import 'package:travelerdubai/view/screens/auth/signin.dart';

class SignupPage extends StatelessWidget {
  final SignupController signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 400,
          height: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("./assets/logo.png"),
              SizedBox(height: 20),
              _buildEmailTextField(signupController.emailController),
              SizedBox(height: 10),
              _buildPasswordTextField(signupController.passwordController),
              SizedBox(height: 20),
              _buildSignUpButton(signupController),
              SizedBox(height: 10),
              _buildLoginLink(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmailTextField(TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: "Email Address",
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildPasswordTextField(TextEditingController controller) {
    return TextField(
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Password",
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildSignUpButton(SignupController controller) {
    return ElevatedButton(
      onPressed: controller.signUp,
      child: Text("Sign Up"),
      style: ElevatedButton.styleFrom(
        primary: Colors.purpleAccent,
        padding: EdgeInsets.symmetric(horizontal: 40),
      ),
    );
  }

  Widget _buildLoginLink() {
    return GestureDetector(
      onTap: () => Get.to(SigninPage()),
      child: Text(
        "Already Have an Account? Login",
        style: TextStyle(
          fontFamily: "arial",
          fontSize: 14,
          fontWeight: FontWeight.w700,
          decoration: TextDecoration.underline,
          color: Colors.purpleAccent,
        ),
      ),
    );
  }
}
