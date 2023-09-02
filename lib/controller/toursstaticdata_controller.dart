import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:travelerdubai/demodata.dart/demodata.dart';
import 'package:travelerdubai/model/toursstatic.dart';

class TourController extends GetxController {
  var tourData = <TourModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    final Map<String, dynamic> arguments = Get.arguments;
    int countryId = arguments['countryId'];
    int cityId = arguments['cityId'];
    int tourId = arguments['tourId'];
    int contractId = arguments['contractId'];
    String travelDate = arguments['currentDate'];

    // Call fetchTourDetails with the retrieved arguments
    fetchTourDetails(countryId, cityId, tourId, contractId,
        travelDate); // Fetch data when the app starts
  }

  Future<void> fetchTourDetails(int countryId, int cityId, int tourId,
      int contractId, String travelDate) async {
    try {
      final dio = Dio();
      dio.options.headers = {
        'Authorization':
            'Bearer eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiJkNWU4YWZhMC1mNGJhLTQ2NWUtYTAzOS1mZGJiYzMxZWZlZGUiLCJVc2VySWQiOiIzNzU0NSIsIlVzZXJUeXBlIjoiQWdlbnQiLCJQYXJlbnRJRCI6IjAiLCJFbWFpbElEIjoidHJhdmVsZ2F0ZXhAcmF5bmF0b3Vycy5jb20iLCJpc3MiOiJodHRwOi8vcmF5bmFhcGkucmF5bmF0b3Vycy5jb20iLCJhdWQiOiJodHRwOi8vcmF5bmFhcGkucmF5bmF0b3Vycy5jb20ifQ.i6GaRt-RVSlJXKPz7ZVx-axAPLW_hkl7usI_Dw8vP5w', // Replace with your actual token
        'Content-Type': 'application/json',
      };
      final response = await dio.post(
        "https://sandbox.raynatours.com/api/Tour/tourStaticDataById",
        data: {
          "countryId": countryId,
          "cityId": cityId,
          "tourId": tourId,
          "contractId": contractId,
          "travelDate": travelDate,
        },
      );

      if (response.statusCode == 200) {
        final tourDataList = response.data["result"] as List;
        if (tourDataList.isNotEmpty) {
          final tourDetails = TourModel.fromJson(tourDataList.first);
          tourData.value = [tourDetails];
          print(response);
          print("tourdetailslist = $tourDetails");
        } else {
          tourData.value = [];
        }
      } else {
        // tourData.value = demoTours;
      }
    } catch (e) {
      print("$e");
    }
  }
}
