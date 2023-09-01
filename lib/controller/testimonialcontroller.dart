import 'dart:async';

import 'package:get/get.dart';
import 'package:travelerdubai/model/toursstatic.dart';

class TestimonialController extends GetxController {
  var currentIndex = 0.obs;
  List<TourReview> reviewList = [];
  late Timer rotationTimer;
  @override
  void onInit() {
    startRotation();
    //startImageRotation();
    super.onInit();
  }

  void updatereviewList(List<TourReview> reviews) {
    reviewList = reviews;
  }

  void nexttestimonial() {
    currentIndex.value = (currentIndex.value + 1) % reviewList.length;
    print(currentIndex.value);
    print(reviewList.toString());
  }

  void previoustestimonial() {
    currentIndex.value = (currentIndex.value - 1) % reviewList.length;
  }

  void startRotation() {
    rotationTimer = Timer.periodic(Duration(seconds: 3), (timer) {
      currentIndex.value = ((currentIndex.value + 1) % reviewList.length);
    });
  }
}
