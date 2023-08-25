import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelerdubai/constants/contants.dart';
import 'package:travelerdubai/controller/Homepagecontroller.dart';

import 'package:travelerdubai/controller/tours_controller.dart';
import 'package:travelerdubai/view/Widgets%20/footer.dart';
import 'package:travelerdubai/view/Widgets%20/formseection.dart';
import 'package:travelerdubai/view/Widgets%20/heroimage.dart';
import 'package:travelerdubai/view/Widgets%20/tourscard.dart';

class Homepage extends StatelessWidget {
  final TourController tourController = Get.put(TourController());
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height - 100,
      child: ListView(
        children: [
          _buildHeroImageSection(context),
          _buildFormSection(context),
          Obx(() =>
              _buildSection("${homeController.formData.value?.heading2}")),
          Obx(() =>
              _buildSection("${homeController.formData.value?.heading3}")),
          Obx(() =>
              _buildSection("${homeController.formData.value?.heading4}")),
          buildFooter(),
        ],
      ),
    );
  }

  Widget _buildHeroImageSection(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, 0),
      child: Container(
        height: Get.height * .60,
        color: Theme.of(context).colorScheme.secondary,
        child: HeroImageWidget(),
      ),
    );
  }

  Widget _buildFormSection(BuildContext context) {
    return Container(
      height: Get.height * .60,
      color: Theme.of(context).colorScheme.secondary,
      child: FormWidget(),
    );
  }

  Widget _buildSection(String heading) {
    return Container(
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
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTourCards() {
    return Container(
      height: 550,
      child: Obx(
        () {
          if (tourController.tourData.isEmpty) {
            return _buildLoadingIndicator();
          } else {
            return Tourcards(
              tours: tourController.tourData.toList()..shuffle(),
            );
          }
        },
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return Container(
      width: 1,
      height: 4,
      child: RotationTransition(
        turns: AlwaysStoppedAnimation(0.25),
        child: CircularProgressIndicator(
          strokeWidth: 4,
          valueColor: AlwaysStoppedAnimation<Color>(colorPrimary),
        ),
      ),
    );
  }
}
