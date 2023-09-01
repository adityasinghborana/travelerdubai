import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/constants/contants.dart';
import 'package:travelerdubai/controller/Homepagecontroller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelerdubai/view/Widgets%20/button.dart';

class HeroImageWidget extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        final imageUrl = controller.imageList.isNotEmpty
            ? controller.imageList[
                controller.currentIndex.value % controller.imageList.length]
            : 'assets/background.png';
        print(imageUrl);

        return Stack(
          children: [
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Color.fromRGBO(0, 0, 0, 0.5),
            ),
            Positioned(
              top: Get.height * .15,
              left: Get.width * .23,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SelectableText(
                    controller.formData.value?.subtitle ?? 'Sub Title',
                    style: GoogleFonts.playfairDisplay(
                        color: colorwhite,
                        fontSize: 48,
                        fontWeight: FontWeight.w200,
                        fontStyle: FontStyle.italic),
                  ),
                  SelectableText(
                    controller.formData.value?.title ?? 'Title',
                    style: GoogleFonts.playfairDisplay(
                      color: colorPrimary,
                      fontSize: 78,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines:
                        2, // Specify the maximum number of lines to prevent scrolling
                  ),
                  InlineFlexButton(
                      fontsize: 28,
                      vpadding: 20,
                      label: "Explore More",
                      onPressed: (() => print("okay")))
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var i = 1; i <= 4; i++)
                    _buildAnimatedCounter(controller, i),
                ],
              ),
            ),
            Positioned(
              top: Get.height * 0.25,
              width: Get.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: Color.fromRGBO(
                        0, 0, 0, 0.1), // Set your desired background color here
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: colorwhite,
                      ),
                      onPressed: controller.previousImage,
                    ),
                  ),
                  Container(
                    color: Color.fromRGBO(
                        0, 0, 0, 0.1), // Set your desired background color here
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_forward,
                        color: colorwhite,
                      ),
                      onPressed: controller.nextImage,
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildAnimatedCounter(HomeController controller, int index) {
    return Column(
      children: [
        TweenAnimationBuilder<int>(
          duration: Duration(seconds: 1),
          tween: IntTween(begin: 0, end: _getCounterValue(controller, index)),
          builder: (context, value, child) {
            return Text(
              value.toString(),
              style: GoogleFonts.playfairDisplay(
                color: colorwhite,
                fontSize: 96,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
        SelectableText(
          _getLabelValue(controller, index),
          style: GoogleFonts.playfairDisplay(
            color: colorwhite,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  int _getCounterValue(HomeController controller, int index) {
    switch (index) {
      case 1:
        return controller.formData.value?.counter1 ?? 0;
      case 2:
        return controller.formData.value?.counter2 ?? 0;
      case 3:
        return controller.formData.value?.counter3 ?? 0;
      case 4:
        return controller.formData.value?.counter4 ?? 0;
      default:
        return 0;
    }
  }

  String _getLabelValue(HomeController controller, int index) {
    switch (index) {
      case 1:
        return controller.formData.value?.label1 ?? '';
      case 2:
        return controller.formData.value?.label2 ?? '';
      case 3:
        return controller.formData.value?.label3 ?? '';
      case 4:
        return controller.formData.value?.label4 ?? '';
      default:
        return '';
    }
  }
}
