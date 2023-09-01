import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:travelerdubai/service/auth.dart';
import 'package:travelerdubai/view/Widgets%20/footer.dart';
import 'package:travelerdubai/view/Widgets%20/header.dart';
import 'package:travelerdubai/view/screens/homepage.dart';

class Homescreen extends StatelessWidget {
  final ScrollController _pagecontroller = ScrollController();

  @override
  Widget build(BuildContext Context) {
    Get.put(AuthClass());
    return Scaffold(
      body: Column(
        children: [
          Header(),
          Homepage(),
        ],
      ),
    );
  }
}
