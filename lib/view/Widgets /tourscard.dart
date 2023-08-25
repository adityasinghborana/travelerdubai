// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/controller/tours_controller.dart';
import 'package:travelerdubai/model/tours.dart';

class Tourcards extends StatelessWidget {
  String truncateDescription(String description, int maxWords) {
    List<String> words = description.split(' ');
    if (words.length <= maxWords) {
      return description;
    }
    return words.take(maxWords).join(' ') + '...';
  }

  final TourController tourController = Get.put(TourController());
  final List<TourModel> tours;

  Tourcards({required this.tours});

  @override
  Widget build(BuildContext Context) {
    return ListView.builder(
      itemCount: tourController.tourData.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        final tour = tourController.tourData[index];

        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stack(
            children: [
              Container(
                height: 550,
                width: Get.width * .25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color.fromARGB(255, 225, 225, 225),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: Get.width * .25,
                      height: 300,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                        child: Image.network(
                          tour.imagePath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            tour.tourName,
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Container(
                            child: Text(
                              truncateDescription(
                                tour.tourShortDescription,
                                15, // Specify the maximum words
                              ),
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text(
                                  tour.countryName,
                                  style: TextStyle(
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
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Icon(Icons.star)
                                  ],
                                ),
                              ),
                              // ... Add any other children here if needed...
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
