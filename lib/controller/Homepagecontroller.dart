import 'dart:async';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travelerdubai/controller/tours_controller.dart';
import 'package:travelerdubai/model/city.dart';
import 'package:travelerdubai/model/homepage.dart';

class HomeController extends GetxController {
  final TourlistController tourController = TourlistController();
  Rx<Homepagedata?> formData = Rx<Homepagedata?>(null);
  RxList<String> imageList = RxList<String>([]);
  var currentIndex = 0.obs;
  late Timer rotationTimer;

  @override
  void onInit() {
    fetchDataFromFirebase();
    startImageRotation();

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
        title: "${data['title']}" ?? '',
        subtitle: "${data['subtitle']}" ?? '',
        backgroundImage: "${data['backgroundimage']}" ?? '',
        heading: "${data['heading1']}" ?? 'hello',
        detail: "${data['detail']}" ?? 'hello',
        heading2: "${data['heading2']}" ?? 'hello',
        heading3: "${data['heading3']}" ?? 'hello',
        heading4: "${data['heading4']}" ?? 'hello',
        counter1: data['counter1'] as int? ?? 5,
        counter2: data['counter2'] as int? ?? 4,
        counter3: data['counter3'] as int? ?? 4,
        counter4: data['counter4'] as int? ?? 66,
        label1: "${data['label1']}" ?? 'hello',
        label2: "${data['label2']}" ?? 'hello',
        label3: "${data['label3']}" ?? 'hello',
        label4: "${data['label4']}" ?? 'hello',
      );

      if (data['backgroundimage'] is List) {
        imageList.value = List<String>.from(data['backgroundimage']);
      } else {
        print("no images found");
      }
    } else {
      print("no data found");
    }
    print(imageList.value);
  }

  void startImageRotation() {
    rotationTimer = Timer.periodic(Duration(seconds: 3), (timer) {
      currentIndex.value = (currentIndex.value + 1) % imageList.length;
    });
  }

  void nextImage() {
    currentIndex.value = (currentIndex.value + 1) % imageList.length;
  }

  void previousImage() {
    currentIndex.value = (currentIndex.value - 1) % imageList.length;
  }
}
