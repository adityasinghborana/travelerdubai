import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/controller/imagechangercontroller.dart';
import 'package:travelerdubai/controller/testimonialcontroller.dart';
import 'package:travelerdubai/controller/tours_controller.dart';
import 'package:travelerdubai/controller/toursstaticdata_controller.dart';
import 'package:travelerdubai/demodata.dart/demodata.dart';
import 'package:travelerdubai/model/tour.dart';
import 'package:travelerdubai/model/toursstatic.dart';
import 'package:travelerdubai/view/Widgets%20/header.dart';
import 'package:travelerdubai/view/Widgets%20/imagechanger.dart';
import 'package:travelerdubai/view/Widgets%20/testimonialslider.dart';

class TourDetailPage extends StatelessWidget {
  final TourModel tour;

  TourDetailPage(this.tour);

  @override
  Widget build(BuildContext context) {
    final ImageChangerController controller = Get.put(ImageChangerController());
    final List<TourImage> tourImages;
    final TourController tourController = Get.find();
    final TestimonialController testcontroller =
        Get.put(TestimonialController());
    final List<TourReview> reviews;

    return Scaffold(
      body: ListView(
        children: [
          Header(),
          Container(
            height: Get.height * 0.6,
            width: Get.width,
            child: ImageChangerWidget(tour.tourImages),
          ),

          Text(
            tour.tourName,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Country: ${tour.countryName}',
            style: TextStyle(fontSize: 18),
          ),
          Text(
            'City: ${tour.cityName}',
            style: TextStyle(fontSize: 18),
          ),
          Text(
            'Rating: ${tour.rating}',
            style: TextStyle(fontSize: 18),
          ),
          // Add more tour details here
          testimonialWidget(tour.tourReview),
        ],
      ),
    );
  }
}
