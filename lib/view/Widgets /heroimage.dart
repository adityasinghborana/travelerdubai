import 'package:flutter/material.dart';
import "package:get/get.dart";

import 'package:travelerdubai/constants/contants.dart';

class HeroImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext Context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage("https://source.unsplash.com/random/?Dubai,night",
              scale: 2),
          fit: BoxFit.cover,
        ),
      ),
      height: Get.height * .60,
      child: Center(
        child: SelectableText(
          "Discover the great in Dubai",
          style: H1,
        ),
      ),
    );
  }
}
