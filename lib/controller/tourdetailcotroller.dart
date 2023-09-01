import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/model/tour.dart';
import 'package:travelerdubai/model/toursstatic.dart';

class TourDetailController extends GetxController {
  var isLoading = true.obs;
  var hasError = false.obs;
  var tourModel = Rx<TourModel?>(null);

  Future<void> fetchTourDetails(
      int tourId, int cityId, int countryId, int contractId) async {
    try {
      isLoading.value = true;
      final response = await fetchTourDetailsFromApi(
          tourId, cityId, countryId, contractId); // Pass the tourId
      tourModel.value =
          TourModel.fromJson(response); // Use the factory constructor
      isLoading.value = false;
    } catch (error) {
      print('Error fetching tour details: $error');
      isLoading.value = false;
      hasError.value = true;
    }
  }

  Future<Map<String, dynamic>> fetchTourDetailsFromApi(
      int tourId, int cityId, int countryId, int contractId) async {
    final dio = Dio();
    dio.options.headers = {
      'Authorization':
          'Bearer eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiJkNWU4YWZhMC1mNGJhLTQ2NWUtYTAzOS1mZGJiYzMxZWZlZGUiLCJVc2VySWQiOiIzNzU0NSIsIlVzZXJUeXBlIjoiQWdlbnQiLCJQYXJlbnRJRCI6IjAiLCJFbWFpbElEIjoidHJhdmVsZ2F0ZXhAcmF5bmF0b3Vycy5jb20iLCJpc3MiOiJodHRwOi8vcmF5bmFhcGkucmF5bmF0b3Vycy5jb20iLCJhdWQiOiJodHRwOi8vcmF5bmFhcGkucmF5bmF0b3Vycy5jb20ifQ.i6GaRt-RVSlJXKPz7ZVx-axAPLW_hkl7usI_Dw8vP5w',
      'Content-Type': 'application/json',
    };

    final response = await dio.post(
      "https://sandbox.raynatours.com/api/Tour/tourStaticDataById",
      data: {
        "countryId": 13063,
        "cityId": 14777,
        "tourId": 4696,
        "contractId": 300,
        "travelDate": "08-13-2023",
      },
    );

    if (response.statusCode == 200) {
      print(response);
      return response.data["result"];
    } else {
      throw Exception("Failed to fetch tour details");
    }
  }
}
