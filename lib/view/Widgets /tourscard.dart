import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelerdubai/controller/tours_controller.dart';
import 'package:travelerdubai/controller/toursstaticdata_controller.dart';
import 'package:travelerdubai/model/tour.dart';
import 'package:travelerdubai/model/toursstatic.dart';

class Tourcards extends StatelessWidget {
  final TourController tourController = Get.put(TourController());

  final List<Tour> tours;
  // final Function(Tour) onTap;
  final Function(TourModel) onTap;
  Tourcards({required this.tours, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.90, //  set the padding of the listview
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tourController.tourData.length,
        itemBuilder: (context, index) {
          final tour = tourController.tourData[index];
          return InkWell(
            onTap: () => onTap(tour),
            //onTap(tour),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: Get.width * 0.23,
                child: Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                        child: Image.network(
                          "https://d1i3enf1i5tb1f.cloudfront.net/" +
                              "${tour.imagePath}",
                          fit: BoxFit.cover,
                          height: Get.height * .28,
                          width: Get.width * 0.28,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20, bottom: 10, left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              tour.tourName,
                              style: GoogleFonts.playfairDisplay(
                                fontSize: 26,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2),
                              child: Container(
                                child: Text(
                                  truncateDescription(
                                    tour.tourDescription,
                                    13,
                                  ),
                                  style: GoogleFonts.playfairDisplay(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Text(
                                    tour.cityName,
                                    style: GoogleFonts.playfairDisplay(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Text(
                                        "Rating ${tour.rating} ",
                                        style: GoogleFonts.playfairDisplay(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Icon(Icons.star),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Icon(Icons.timer_rounded),
                                  Text(
                                    " ${tour.duration} ",
                                    style: GoogleFonts.playfairDisplay(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  String truncateDescription(String description, int maxWords) {
    List<String> words = description.split(' ');
    if (words.length <= maxWords) {
      return description;
    }
    return words.take(maxWords).join(' ') + '...';
  }
}
