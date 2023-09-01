import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/model/Aboutus.dart';

class AboutUsController extends GetxController {
  Rx<Aboutpagedata?> aboutData = Rx<Aboutpagedata?>(null);
  RxList<String> imageList = RxList<String>([]);
  var currentIndex = 0.obs;

  late Timer rotationTimer;

  @override
  void onInit() {
    fetchDataFromFirebase();
    startImageRotation();
    super.onInit();
  }

  @override
  void onClose() {
    rotationTimer.cancel(); // Cancel the timer when the controller is disposed
    super.onClose();
  }

  Future<void> fetchDataFromFirebase() async {
    final doc = await FirebaseFirestore.instance
        .collection('pages')
        .doc('aboutus')
        .get();

    var data = doc.data();

    if (data is Map<String, dynamic>) {
      aboutData.value = Aboutpagedata(
        title: "${data['title']}" ?? 'hello',
        heading1: "${data['heading1']}" ?? 'hello',
        detail1: "${data['detail1']}" ?? 'hello',
        heading2: "${data['heading2']}" ?? 'hello',
        subheading2: "${data['subheading2']}" ?? 'hello',
        subheading1: "${data['subheading1']}" ?? 'hello',
        imagepath: "${data['imagepath']}" ?? 'cant be loaded',
        detail2: "${data['detail2']}" ?? 'hello',
        imagepath2: "${data['imagepath2']}" ?? 'cant be loaded',
        imagepath3: "${data['imagepath3']}" ?? 'cant be loaded',
      );
      if (data['images'] is List) {
        imageList.value = List<String>.from(data['images']);
      }
      print(imageList.value);
    } else {
      print("nothing found");
    }
  }

  void startImageRotation() {
    rotationTimer = Timer.periodic(Duration(seconds: 3), (timer) {
      currentIndex.value = (currentIndex.value + 1) % imageList.length;
    });
  }

  void moveToNextImage() {
    currentIndex.value = (currentIndex.value + 1) % imageList.length;
  }
}
