import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travelerdubai/model/homepage.dart';

class HomeController extends GetxController {
  Rx<Homepagedata?> formData = Rx<Homepagedata?>(null);

  @override
  void onInit() {
    fetchDataFromFirebase();
    super.onInit();
  }

  Future<void> fetchDataFromFirebase() async {
    final doc = await FirebaseFirestore.instance
        .collection('pages')
        .doc('Homepage')
        .get();

    var data = doc.data();

    if (data is Map<String, dynamic>) {
      formData.value = Homepagedata(
        heading: "${data['heading1']}" ?? 'hello',
        detail: "${data['detail']}" ?? 'hello',
        heading2: "${data['heading2']}" ?? 'hello',
        heading3: "${data['heading3']}" ?? 'hello',
        heading4: "${data['heading4']}" ?? 'hello',
      );
    } else {
      print("nothing found");
    }
  }
}
