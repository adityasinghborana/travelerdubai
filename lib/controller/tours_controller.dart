import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:travelerdubai/model/city.dart';
import 'package:travelerdubai/model/tour.dart';
import 'package:travelerdubai/model/toursstatic.dart';

class TourlistController extends GetxController {
  final Dio _dio = Dio();
  RxList<Tour> tours = <Tour>[].obs;

  List<City> cities = [
    City(id: 13160),
    City(id: 13236),
    City(id: 13668),
    City(id: 13765),
    City(id: 14644),
    City(id: 14777),
  ];

  @override
  void onInit() {
    super.onInit();
    fetchToursForAllCities(cities.map((city) => city.id).toList());
  }

  Future<void> fetchToursForCity(int cityId) async {
    try {
      _dio.options.headers = {
        'Authorization':
            'Bearer eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiJkNWU4YWZhMC1mNGJhLTQ2NWUtYTAzOS1mZGJiYzMxZWZlZGUiLCJVc2VySWQiOiIzNzU0NSIsIlVzZXJUeXBlIjoiQWdlbnQiLCJQYXJlbnRJRCI6IjAiLCJFbWFpbElEIjoidHJhdmVsZ2F0ZXhAcmF5bmF0b3Vycy5jb20iLCJpc3MiOiJodHRwOi8vcmF5bmFhcGkucmF5bmF0b3Vycy5jb20iLCJhdWQiOiJodHRwOi8vcmF5bmFhcGkucmF5bmF0b3Vycy5jb20ifQ.i6GaRt-RVSlJXKPz7ZVx-axAPLW_hkl7usI_Dw8vP5w',
        'Content-Type': 'application/json',
      };
      final response = await _dio.post(
        'https://sandbox.raynatours.com/api/Tour/tourstaticdata',
        data: {
          'cityId': cityId,
          "travelDate": "08-13-2023",
          "countryId": 13063,
        },
      );
      final List<dynamic> tourDataList = response.data['result'];
      final toursForCity = tourDataList
          .map((data) => Tour(
                id: data['tourId'],
                countryId: data['countryId'],
                countryName: data['countryName'],
                cityId: data['cityId'],
                cityName: data['cityName'],
                name: data['tourName'] ?? '',
                reviewCount: data['reviewCount'],
                rating: data['rating'],
                duration: data['duration'] ?? '',
                imagePath: data['imagePath'] ?? '',
                imageCaptionName: data['imageCaptionName'] ?? '',
                cityTourTypeId: data['cityTourTypeId'] ?? '',
                cityTourType: data['cityTourType'] ?? '',
                shortDescription: data['tourShortDescription'] ?? '',
                cancellationPolicyName: data['cancellationPolicyName'] ?? '',
                isSlot: data['isSlot'],
                onlyChild: data['onlyChild'],
                contractId: data['contractId'],
                recommended: data['recommended'],
                isPrivate: data['isPrivate'],
              ))
          .toList();
      tours.addAll(toursForCity); // Append the tours to the existing list

    } catch (error) {
      print('Error fetching tours: $error');
    }
  }

  Future<void> fetchToursForAllCities(List<int> cityIds) async {
    for (int cityId in cityIds) {
      await fetchToursForCity(cityId);
    }
  }

  TourModel convertToTourModel(Tour tour) {
    return TourModel(
      tourId: tour.id,
      countryId: tour.countryId,
      countryName: tour.countryName,
      cityId: tour.cityId,
      cityName: tour.cityName,
      tourName: tour.name,
      reviewCount: tour.reviewCount,
      rating: tour.rating,
      duration: tour.duration,
      imagePath: tour.imagePath,
      imageCaptionName: tour.imageCaptionName,
      cityTourTypeId: tour.cityTourTypeId,
      cityTourType: tour.cityTourType,
      tourDescription: tour.shortDescription,
      // Map other propertiedeparturePoint: tour.departurePoint,
      tourShortDescription: tour.shortDescription,
      raynaToursAdvantage: '', // You can set this property as needed
      whatsInThisTour: '', // You can set this property as needed
      importantInformation: '', // You can set this property as needed
      itenararyDescription: '', // You can set this property as needed
      usefulInformation: '', // You can set this property as needed
      termsAndConditions: '', // You can set this property as needed
      cancellationPolicyName: tour.cancellationPolicyName,
      cancellationPolicyDescription: '', // You can set this property as needed
      childCancellationPolicyName: '', // You can set this property as needed
      childCancellationPolicyDescription:
          '', // You can set this property as needed
      childAge: '', // You can set this property as needed
      infantAge: '', // You can set this property as needed
      infantCount: 0, // You can set this property as needed
      isSlot: tour.isSlot,
      onlyChild: tour.onlyChild,
      contractId: 0, // You can set this property as needed
      latitude: '', // You can set this property as needed
      longitude: '', // You can set this property as needed
      startTime: '', // You can set this property as needed
      meal: null, // You can set this property as needed
      videoUrl: '', // You can set this property as needed
      googleMapUrl: '', // You can set this property as needed
      tourExclusion: '', // You can set this property as needed
      howToRedeem: '', // You can set this property as needed
      tourImages: [], // You can set this property as needed
      tourReview: [], // You can set this property as needed
      questions: null, // You can set this property as neededs
      departurePoint: "",
      reportingTime: "",
      tourInclusion: '',
      tourLanguage: "", // ...
    );
  }
}
