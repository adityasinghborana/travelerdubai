import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelerdubai/constants/contants.dart';
import 'package:travelerdubai/controller/Homepagecontroller.dart';
import 'package:travelerdubai/controller/mygridscetio_controller.dart';
import 'package:travelerdubai/controller/tours_controller.dart';

import 'package:travelerdubai/controller/toursstaticdata_controller.dart';
import 'package:travelerdubai/demodata.dart/demodata.dart';
import 'package:travelerdubai/view/Widgets%20/footer.dart';
import 'package:travelerdubai/view/Widgets%20/formsection.dart';
import 'package:travelerdubai/view/Widgets%20/gridsection.dart';
import 'package:travelerdubai/view/Widgets%20/heroimage.dart';
import 'package:travelerdubai/view/Widgets%20/tourlisttrial.dart';
import 'package:travelerdubai/view/Widgets%20/tourscard.dart';
import 'package:travelerdubai/view/screens/tourdeatilspage.dart';

class Homepage extends StatelessWidget {
  // final TourController tourController = Get.put(TourController());
  final HomeController homeController = Get.put(HomeController());
  final MyGridSectionController controller = Get.put(MyGridSectionController());
  final TourlistController tourlistController = Get.put(TourlistController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorwhite,
      height: Get.height - 100,
      child: ListView(
        children: [
          _buildHeroImageSection(context),
          _buildFormSection(context),
          Obx(() {
            return _buildSection("${homeController.formData.value?.heading2}");
          }),
          Obx(() =>
              _buildSection("${homeController.formData.value?.heading3}")),
          MyGridSectionWidget(),
          Obx(() =>
              _buildSection("${homeController.formData.value?.heading4}")),
          Container(
              color: Colors.white, height: Get.height * .55, child: tourlist()),
          buildFooter(),
        ],
      ),
    );
  }

  Widget _buildHeroImageSection(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, 0),
      child: Container(
        height: Get.height * .70,
        color: Theme.of(context).colorScheme.secondary,
        child: HeroImageWidget(),
      ),
    );
  }

  Widget _buildFormSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 100, vertical: 50),
      width: Get.width,
      height: Get.height * .60,
      child: FormWidget(),
    );
  }

  Widget _buildSection(String heading) {
    return Container(
      color: Colors.white,
      height: Get.height * .80,
      child: Column(
        children: [
          _buildHeading(heading),
          _buildTourCards(),
          SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildHeading(String heading) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Center(
        child: SelectableText(
          heading ?? "form could not be displayed, connect from backend",
          style: GoogleFonts.playfairDisplay(
            textStyle: TextStyle(
                color: Colors.black,
                letterSpacing: .5,
                fontSize: 48,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _buildTourCards() {
    final tourlist = tourlistController.tours.value
      ..shuffle(); //to update it to api list

    return Container(
      color: Colors.white,
      height: Get.height * .55,
      child: Obx(
        () {
          if (tourlistController.tours.isEmpty) {
            return CircularProgressIndicator(
              color: colorPrimary,
            );
          } else {
            return Tourcards(
              tours: tourlist,
            );
          }
        },
      ),
    );
  }
}
