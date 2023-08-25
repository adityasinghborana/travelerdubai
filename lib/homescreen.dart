import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:travelerdubai/view/Widgets%20/footer.dart';
import 'package:travelerdubai/view/Widgets%20/header.dart';
import 'package:travelerdubai/homepage.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext Context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            header(),
            Homepage(),
          ],
        ),
      ),
    );
  }
}
