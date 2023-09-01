import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/constants/contants.dart';
import 'package:travelerdubai/view/Widgets%20/form.dart';
import 'package:travelerdubai/view/Widgets%20/featurewidget.dart';

class FormWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colorwhite,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Card(
            elevation: 6,
            child: Container(
              width: Get.width * .3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: ExploreAndTravelForm(),
              ),
            ),
          ),
          FeaturesSection(),
        ],
      ),
    );
  }
}
