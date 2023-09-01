import 'dart:async';

import 'package:get/get.dart';
import 'package:travelerdubai/model/toursstatic.dart';

class ImageChangerController extends GetxController {
  var currentIndex = 0.obs;
  List<TourImage> imageList = [];
  late Timer rotationTimer;
  @override
  void onInit() {
    startImageRotation();
    //startImageRotation();
    super.onInit();
  }

  void updateImageList(List<TourImage> images) {
    imageList = images;
  }

  void nextImage() {
    currentIndex.value = (currentIndex.value + 1) % imageList.length;
  }

  void previousImage() {
    currentIndex.value = (currentIndex.value - 1) % imageList.length;
  }

  void startImageRotation() {
    rotationTimer = Timer.periodic(Duration(seconds: 3), (timer) {
      currentIndex.value = ((currentIndex.value + 1) % imageList.length);
    });
  }
}
