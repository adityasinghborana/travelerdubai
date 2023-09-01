import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/controller/tours_controller.dart';

class tourlist extends StatelessWidget {
  final TourlistController tour1Controller = Get.put(TourlistController());
  final ScrollController iii = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (tour1Controller.tours.isEmpty) {
        return CircularProgressIndicator();
      } else {
        return ListView.builder(
          controller: iii,
          itemCount: tour1Controller.tours.length,
          itemBuilder: (context, index) {
            final tour = tour1Controller.tours[index];
            return Text("${tour.cityName}");

            // Add more widgets to display other tour details as needed
          },
        );
      }
    });
  }
}
