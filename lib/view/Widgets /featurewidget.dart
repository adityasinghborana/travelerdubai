import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts package
import 'package:travelerdubai/constants/contants.dart';

import 'package:travelerdubai/controller/featiresection.dart';
import 'package:travelerdubai/model/featuremodel.dart';

class FeaturesSection extends StatelessWidget {
  final FeatureController controller = Get.put(FeatureController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.5, // Adjusted value
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Features",
            style: GoogleFonts.playfairDisplay(
              // Apply Playfair Display font
              textStyle: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SelectableText(
            // Use SelectableText for selectable text
            "Choose the features that interest you:Choose the features that interest you:Choose the features that interest you:Choose the features that interest you:Choose the features that interest you:Choose the features that interest you:Choose the features that interest you:Choose the features that interest you:",
            style: TextStyle(
              fontSize: 16,
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(height: 10),
          Obx(
            () => Column(
              children: controller.features
                  .map((feature) => FeatureRow(
                        feature: feature,
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class FeatureRow extends StatelessWidget {
  final Feature feature;

  FeatureRow({
    required this.feature,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(
            feature.icon,
            color: Colors.amber, // Set your desired icon color
          ),
          SizedBox(width: 8),
          Text(
            feature.title,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
