import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/controller/Homepagecontroller.dart';

class FormWidget extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(255, 213, 125, 210),
            Color.fromARGB(255, 21, 239, 255),
          ],
        ),
      ),
      height: Get.height * .60,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              width: Get.width * .20,
              height: Get.height * .40,
              child: Center(
                child: Obx(() => SelectableText(
                      homeController.formData.value?.heading ??
                          "form could not be displayed, connect from backend",
                      style: TextStyle(
                        color: Colors.black, // Set your desired text color
                        fontSize: 18, // Set your desired font size
                      ),
                    )),
              ),
            ),
            SizedBox(
              width: 200,
            ),
            Expanded(
              child: Column(
                children: [
                  Obx(() => SelectableText(
                        homeController.formData.value?.heading ??
                            "Heading", // You might want to change this
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: .5,
                          fontSize: 48,
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Obx(() => SelectableText(
                        homeController.formData.value?.detail ??
                            "Discover the great in Dubai...",
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: .5,
                          fontSize: 18,
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
