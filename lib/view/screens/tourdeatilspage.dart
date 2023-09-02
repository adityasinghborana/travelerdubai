import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:travelerdubai/controller/toursstaticdata_controller.dart';
import 'package:travelerdubai/view/Widgets%20/imagechanger.dart'; // Import your TourController

class TourDetailPage extends StatelessWidget {
  final TourController tourController = Get.put(TourController());

  @override
  Widget build(BuildContext context) {
    // Receive arguments passed from the previous page
    final Map<String, dynamic> arguments = Get.arguments;
    int countryId = arguments['countryId'];
    int cityId = arguments['cityId'];
    int tourId = arguments['tourId'];
    int contractId = arguments['contractId'];
    String currentDate = arguments['currentDate'];

    // Use Obx to reactively update the UI when tour data changes
    return Scaffold(
      appBar: AppBar(
        title: Text('Tour Details'),
      ),
      body: Obx(() {
        final tour = tourController.tourData;
        if (tour.isEmpty) {
          // While data is being fetched or if it's empty, display a loading indicator or message
          return Center(child: CircularProgressIndicator()); // Or a message
        } else {
          // Display tour details here using tourController.tourData
          // Example: tourController.tourData[0].tourName
          return Column(
            children: [ImageChangerWidget(tour[0].tourImages)],
          );
        }
      }),
    );
  }
}
