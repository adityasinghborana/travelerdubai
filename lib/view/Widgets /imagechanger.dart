import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/constants/contants.dart';
import 'package:travelerdubai/controller/imagechangercontroller.dart';
import 'package:travelerdubai/model/toursstatic.dart';

class ImageChangerWidget extends StatelessWidget {
  final ImageChangerController controller = Get.put(ImageChangerController());
  final List<TourImage> tourImages;

  ImageChangerWidget(this.tourImages) {
    controller.updateImageList(tourImages);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Image.network(
            controller.imageList[controller.currentIndex.value].imagePath
                as String,
            width: Get.width,
            height: Get.height * 0.5,
            fit: BoxFit.cover,
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
                    icon: Icon(Icons.arrow_back, color: colorwhite),
                    onPressed: controller.previousImage,
                  ),
                ),
                Container(
                  color: Color.fromRGBO(
                      0, 0, 0, 0.1), // Set your desired background color here
                  child: IconButton(
                      icon: Icon(Icons.arrow_forward, color: colorwhite),
                      onPressed: controller.nextImage),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
