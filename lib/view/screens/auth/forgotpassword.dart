import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:travelerdubai/view/screens/auth/signin.dart';

class Forgotpassword extends StatelessWidget {
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext Context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Color(0xff979797)),
                    hintText: "Enter Your Email",
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                ElevatedButton(
                  onPressed: () {
                    resetpassword(Context);
                  },
                  child: SelectableText("Send Link"),
                  style: ElevatedButton.styleFrom(
                    alignment: Alignment.center,
                    primary: Color(0xffBF1D2D),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future resetpassword(BuildContext Context) async {
    try {
      await firebase_auth.FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      final snackbar =
          SnackBar(content: SelectableText("Reset link Sent to Email"));

      ScaffoldMessenger.of(Context).showSnackBar(snackbar);
      Navigator.pushAndRemoveUntil(
          Context,
          MaterialPageRoute(builder: (Context) => SigninPage()),
          (route) => false);
    } on FirebaseAuthException catch (e) {
      final snackbar = SnackBar(content: SelectableText(e.toString()));

      ScaffoldMessenger.of(Context).showSnackBar(snackbar);
    }
  }
}
