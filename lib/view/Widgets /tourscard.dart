import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelerdubai/controller/tours_controller.dart';
import 'package:travelerdubai/controller/toursstaticdata_controller.dart';
import 'package:travelerdubai/model/tour.dart';

class Tourcards extends StatelessWidget {
  final TourlistController tourlistController = Get.put(TourlistController());
  final List<Tour> tours;

  Tourcards({required this.tours});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tourlistController.tours.length,
        itemBuilder: (context, index) {
          final tour = tourlistController.tours[index];
          return InkWell(
            onTap: () => _onTourCardTap(tour), // Use the onTap function
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
                      _buildTourImage(
                          tour), // Extracted method for the tour image
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20, bottom: 10, left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildTourName(
                                tour), // Extracted method for the tour name
                            _buildShortDescription(
                                tour), // Extracted method for the short description
                            SizedBox(height: 10),
                            _buildRatingAndCity(
                                tour), // Extracted method for rating and city
                            _buildDuration(
                                tour), // Extracted method for tour duration
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

  void _onTourCardTap(Tour tour) {
    // Handle tour card tap here
    // Extract the necessary properties
    int countryId = tour.countryId;
    int cityId = tour.cityId;
    int tourId = tour.id;
    int contractId = tour.contractId;

    // Get the current date in MM/DD/YYYY format
    String currentDate =
        DateTime.now().toString().split(' ')[0]; // Extracts the date part

    // Navigate to the details page and pass the properties as arguments
    Get.toNamed(
      '/tour_details', // Replace with your actual route name
      arguments: {
        'countryId': countryId,
        'cityId': cityId,
        'tourId': tourId,
        'contractId': contractId,
        'currentDate': currentDate,
      },
    );
  }

  Widget _buildTourImage(Tour tour) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
      child: Image.network(
        "https://d1i3enf1i5tb1f.cloudfront.net/${tour.imagePath}",
        fit: BoxFit.cover,
        height: Get.height * .28,
        width: Get.width * 0.28,
      ),
    );
  }

  Widget _buildTourName(Tour tour) {
    return Text(
      _truncateDescription(tour.name, 4),
      style: GoogleFonts.playfairDisplay(
        fontSize: 26,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _buildShortDescription(Tour tour) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Container(
        child: Text(
          _truncateDescription(tour.shortDescription, 13),
          style: GoogleFonts.playfairDisplay(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }

  Widget _buildRatingAndCity(Tour tour) {
    return Row(
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
    );
  }

  Widget _buildDuration(Tour tour) {
    return Container(
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
    );
  }

  String _truncateDescription(String description, int maxWords) {
    List<String> words = description.split(' ');
    if (words.length <= maxWords) {
      return description;
    }
    return words.take(maxWords).join(' ') + '...';
  }
}
