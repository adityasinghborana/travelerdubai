import 'package:flutter/material.dart';
import 'package:travelerdubai/service/auth.dart';
import 'package:travelerdubai/view/Widgets%20/imageslider.dart';
import 'package:travelerdubai/homepage.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext Context) {
    AuthClass authClass = AuthClass();
    return Scaffold(
      body: Container(
        height: 300,
        width: double.infinity,
        child: Column(
          children: [
            ImageSliderWidget(),
            SelectableText("all the Dashboard Data to be displayed here "),
            ElevatedButton(
                onPressed: () async {
                  await authClass.signOut(Context: Context);
                  Navigator.pushAndRemoveUntil(
                      Context,
                      MaterialPageRoute(builder: (Context) => Homepage()),
                      (route) => false);
                },
                child: SelectableText("Logout")),
          ],
        ),
      ),
    );
  }
}
