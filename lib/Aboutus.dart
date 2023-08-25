import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/controller/about_us_controller.dart';
import 'package:travelerdubai/view/Widgets%20/header.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext Context) {
    final AboutUsController controller = Get.put(AboutUsController());
    final ScrollController scrollController = ScrollController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            header(),
            // Banner with overlay text
            bannerWithOverlayText(Context,
                'https://source.unsplash.com/random/?banner', 'About Us'),

            // Section 1
            twoColumnSection(
              Context,
              'https://source.unsplash.com/random/?image1',
              'Heading 1',
              'Subheading 1',
              'Description text for section 1.',
              invert: false,
            ),

            // Section 2 (Inverted)
            twoColumnSection(
              Context,
              'https://source.unsplash.com/random/?image2',
              'Heading 2',
              'Subheading 2',
              'Description text for section 2.',
              invert: true,
            ),

            // Banner with button overlay
            bannerWithButton(Context,
                'https://source.unsplash.com/random/?banner2', 'Explore Tours'),
          ],
        ),
      ),
    );
  }

  Widget bannerWithOverlayText(
      BuildContext context, String imageUrl, String text) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontSize: 32, color: colorwhite, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget twoColumnSection(BuildContext context, String imageUrl, String heading,
      String subheading, String description,
      {bool invert = false}) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.1),
      child: Row(
        children: invert
            ? [
                textColumn(heading, subheading, description),
                imageColumn(imageUrl),
              ]
            : [
                imageColumn(imageUrl),
                textColumn(heading, subheading, description),
              ],
      ),
    );
  }

  Widget imageColumn(String imageUrl) {
    return Expanded(
      child: Image.network(imageUrl, fit: BoxFit.cover),
    );
  }

  Widget textColumn(String heading, String subheading, String description) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(heading,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(subheading,
                style: TextStyle(fontSize: 20, color: colorgreydark)),
            SizedBox(height: 16),
            Text(description, style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }

  Widget bannerWithButton(
      BuildContext context, String imageUrl, String buttonText) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.1),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: Text(buttonText),
        ),
      ),
    );
  }
}

// Colors
const colorPrimary = Color(0xFFDF46DC);
const colorHighlights = Color(0xFF0EACD7);
const colorlightgrey = Color(0xFF999999);
const colorwhite = Color(0xFFffffff);
const colorblack = Color(0xFF111B19);
const colorgreydark = Color(0XFF444444);
