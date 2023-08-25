import 'dart:math';

import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:travelerdubai/model/tours.dart';

class TourController extends GetxController {
  var tourData = <TourModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchTourData(); // Fetch data when the app starts
  }

  Future<void> fetchTourData() async {
    try {
      final dio = Dio();
      dio.options.headers = {
        'Authorization':
            'Bearer eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiJkNWU4YWZhMC1mNGJhLTQ2NWUtYTAzOS1mZGJiYzMxZWZlZGUiLCJVc2VySWQiOiIzNzU0NSIsIlVzZXJUeXBlIjoiQWdlbnQiLCJQYXJlbnRJRCI6IjAiLCJFbWFpbElEIjoidHJhdmVsZ2F0ZXhAcmF5bmF0b3Vycy5jb20iLCJpc3MiOiJodHRwOi8vcmF5bmFhcGkucmF5bmF0b3Vycy5jb20iLCJhdWQiOiJodHRwOi8vcmF5bmFhcGkucmF5bmF0b3Vycy5jb20ifQ.i6GaRt-RVSlJXKPz7ZVx-axAPLW_hkl7usI_Dw8vP5w', // Replace with your actual token
        'Content-Type': 'application/json',
      };
      final response = await dio.post(
        "https://sandbox.raynatours.com/api/Tour/tourstaticdata",
        data: {
          // "countryId": 13063,
          // "cityId": 14777,
          "countryId": 13063,
          "cityId": 13668,
        },
      );

      if (response.statusCode == 200) {
        final tourList = response.data["result"] as List;
        tourData.value =
            tourList.map((tour) => TourModel.fromJson(tour)).toList();
        print(response);
      } else {
        print("API Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Exception: $e");
    }
  }
}
