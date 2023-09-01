// class TourModel {
//   final int tourId;
//   final int countryId;
//   final String countryName;
//   final int cityId;
//   final String cityName;
//   final String tourName;
//   final int reviewCount;
//   final double rating;
//   final String duration;
//   final String departurePoint;
//   final String reportingTime;
//   final String tourLanguage;
//   final String imagePath;
//   final String imageCaptionName;
//   final String cityTourTypeId;
//   final String cityTourType;
//   final String tourDescription;
//   final String tourInclusion;
//   final String tourShortDescription;
//   final String raynaToursAdvantage;
//   final String whatsInThisTour;
//   final String importantInformation;
//   final String itenararyDescription;
//   final String usefulInformation;
//   final String faqDetails;
//   final String termsAndConditions;
//   final String cancellationPolicyName;
//   final String cancellationPolicyDescription;
//   final String childCancellationPolicyName;
//   final String childCancellationPolicyDescription;
//   final String childAge;
//   final String infantAge;
//   final int infantCount;
//   final bool isSlot;
//   final bool onlyChild;
//   final int contractId;
//   final List<TourImage> tourImages;
//   final List<TourReview> tourReview;

//   TourModel({
//     required this.tourId,
//     required this.countryId,
//     required this.countryName,
//     required this.cityId,
//     required this.cityName,
//     required this.tourName,
//     required this.reviewCount,
//     required this.rating,
//     required this.duration,
//     required this.departurePoint,
//     required this.reportingTime,
//     required this.tourLanguage,
//     required this.imagePath,
//     required this.imageCaptionName,
//     required this.cityTourTypeId,
//     required this.cityTourType,
//     required this.tourDescription,
//     required this.tourInclusion,
//     required this.tourShortDescription,
//     required this.raynaToursAdvantage,
//     required this.whatsInThisTour,
//     required this.importantInformation,
//     required this.itenararyDescription,
//     required this.usefulInformation,
//     required this.faqDetails,
//     required this.termsAndConditions,
//     required this.cancellationPolicyName,
//     required this.cancellationPolicyDescription,
//     required this.childCancellationPolicyName,
//     required this.childCancellationPolicyDescription,
//     required this.childAge,
//     required this.infantAge,
//     required this.infantCount,
//     required this.isSlot,
//     required this.onlyChild,
//     required this.contractId,
//     required this.tourImages,
//     required this.tourReview,
//   });

//   factory TourModel.fromJson(Map<String, dynamic> json) {
//     return TourModel(
//       tourId: json['tourId'],
//       countryId: json['countryId'],
//       countryName: json['countryName'],
//       cityId: json['cityId'],
//       cityName: json['cityName'],
//       tourName: json['tourName'],
//       reviewCount: json['reviewCount'],
//       rating: json['rating'],
//       duration: json['duration'],
//       departurePoint: json['departurePoint'],
//       reportingTime: json['reportingTime'],
//       tourLanguage: json['tourLanguage'],
//       imagePath: json['imagePath'],
//       imageCaptionName: json['imageCaptionName'],
//       cityTourTypeId: json['cityTourTypeId'],
//       cityTourType: json['cityTourType'],
//       tourDescription: json['tourDescription'],
//       tourInclusion: json['tourInclusion'],
//       tourShortDescription: json['tourShortDescription'],
//       raynaToursAdvantage: json['raynaToursAdvantage'],
//       whatsInThisTour: json['whatsInThisTour'],
//       importantInformation: json['importantInformation'],
//       itenararyDescription: json['itenararyDescription'],
//       usefulInformation: json['usefulInformation'],
//       faqDetails: json['faqDetails'],
//       termsAndConditions: json['termsAndConditions'],
//       cancellationPolicyName: json['cancellationPolicyName'],
//       cancellationPolicyDescription: json['cancellationPolicyDescription'],
//       childCancellationPolicyName: json['childCancellationPolicyName'],
//       childCancellationPolicyDescription:
//           json['childCancellationPolicyDescription'],
//       childAge: json['childAge'],
//       infantAge: json['infantAge'],
//       infantCount: json['infantCount'],
//       isSlot: json['isSlot'],
//       onlyChild: json['onlyChild'],
//       contractId: json['contractId'],
//       tourImages: (json['tourImages'] as List<dynamic>)
//           .map<TourImage>((imageData) => TourImage.fromJson(imageData))
//           .toList(),
//       tourReview: (json['tourReview'] as List<dynamic>)
//           .map<TourReview>((reviewData) => TourReview.fromJson(reviewData))
//           .toList(),
//     );
//   }
// }

// class TourImage {
//   final int tourId;
//   final String imagePath;
//   final String imageCaptionName;
//   final String isFrontImage;
//   final String isBannerImage;
//   final String isBannerRotateImage;

//   TourImage({
//     required this.tourId,
//     required this.imagePath,
//     required this.imageCaptionName,
//     required this.isFrontImage,
//     required this.isBannerImage,
//     required this.isBannerRotateImage,
//   });

//   factory TourImage.fromJson(Map<String, dynamic> json) {
//     return TourImage(
//       tourId: json['tourId'],
//       imagePath: json['imagePath'],
//       imageCaptionName: json['imageCaptionName'],
//       isFrontImage: json['isFrontImage'],
//       isBannerImage: json['isBannerImage'],
//       isBannerRotateImage: json['isBannerRotateImage'],
//     );
//   }
// }

// class TourReview {
//   final int id;
//   final int tourId;
//   final int reviewId;
//   final String reviewTitle;
//   final String reviewContent;
//   final String visitMonth;
//   final double rating;
//   final String imagePath;
//   final String guestName;

//   TourReview({
//     required this.id,
//     required this.tourId,
//     required this.reviewId,
//     required this.reviewTitle,
//     required this.reviewContent,
//     required this.visitMonth,
//     required this.rating,
//     required this.imagePath,
//     required this.guestName,
//   });

//   factory TourReview.fromJson(Map<String, dynamic> json) {
//     return TourReview(
//       id: json['id'],
//       tourId: json['tourId'],
//       reviewId: json['reviewId'],
//       reviewTitle: json['reviewTitle'],
//       reviewContent: json['reviewContent'],
//       visitMonth: json['visitMonth'],
//       rating: json['rating'],
//       imagePath: json['imagePath'],
//       guestName: json['guestName'],
//     );
//   }
// }

class TourDetail {
  int statuscode;
  dynamic error;
  String url;
  int count;
  List<TourModel> result;

  TourDetail({
    required this.statuscode,
    required this.error,
    required this.url,
    required this.count,
    required this.result,
  });

  factory TourDetail.fromJson(Map<String, dynamic> json) {
    List<TourModel> result = [];
    if (json['result'] != null) {
      result = List<TourModel>.from(
          json['result'].map((x) => TourModel.fromJson(x)));
    }
    return TourDetail(
      statuscode: json['statuscode'],
      error: json['error'],
      url: json['url'],
      count: json['count'],
      result: result,
    );
  }
}

class TourModel {
  int tourId;
  int countryId;
  String countryName;
  int cityId;
  String cityName;
  String tourName;
  int reviewCount;
  double rating;
  String duration;
  String departurePoint;
  String reportingTime;
  String tourLanguage;
  String imagePath;
  String imageCaptionName;
  String cityTourTypeId;
  String cityTourType;
  String tourDescription;
  String tourInclusion;
  String tourShortDescription;
  String raynaToursAdvantage;
  String whatsInThisTour;
  String importantInformation;
  String itenararyDescription;
  String usefulInformation;
  String termsAndConditions;
  String cancellationPolicyName;
  String cancellationPolicyDescription;
  String childCancellationPolicyName;
  String childCancellationPolicyDescription;
  String childAge;
  String infantAge;
  int infantCount;
  bool isSlot;
  bool onlyChild;
  int contractId;
  String latitude;
  String longitude;
  String startTime;
  dynamic meal;
  String videoUrl;
  String googleMapUrl;
  String tourExclusion;
  String howToRedeem;
  List<TourImage> tourImages;
  List<TourReview> tourReview;
  dynamic questions;

  TourModel({
    required this.tourId,
    required this.countryId,
    required this.countryName,
    required this.cityId,
    required this.cityName,
    required this.tourName,
    required this.reviewCount,
    required this.rating,
    required this.duration,
    required this.departurePoint,
    required this.reportingTime,
    required this.tourLanguage,
    required this.imagePath,
    required this.imageCaptionName,
    required this.cityTourTypeId,
    required this.cityTourType,
    required this.tourDescription,
    required this.tourInclusion,
    required this.tourShortDescription,
    required this.raynaToursAdvantage,
    required this.whatsInThisTour,
    required this.importantInformation,
    required this.itenararyDescription,
    required this.usefulInformation,
    required this.termsAndConditions,
    required this.cancellationPolicyName,
    required this.cancellationPolicyDescription,
    required this.childCancellationPolicyName,
    required this.childCancellationPolicyDescription,
    required this.childAge,
    required this.infantAge,
    required this.infantCount,
    required this.isSlot,
    required this.onlyChild,
    required this.contractId,
    required this.latitude,
    required this.longitude,
    required this.startTime,
    required this.meal,
    required this.videoUrl,
    required this.googleMapUrl,
    required this.tourExclusion,
    required this.howToRedeem,
    required this.tourImages,
    required this.tourReview,
    required this.questions,
  });

  factory TourModel.fromJson(Map<String, dynamic> json) {
    List<TourImage> tourImages = [];
    if (json['tourImages'] != null) {
      tourImages = List<TourImage>.from(
          json['tourImages'].map((x) => TourImage.fromJson(x)));
    }
    List<TourReview> tourReview = [];
    if (json['tourReview'] != null) {
      tourReview = List<TourReview>.from(
          json['tourReview'].map((x) => TourReview.fromJson(x)));
    }
    return TourModel(
      tourId: json['tourId'],
      countryId: json['countryId'],
      countryName: json['countryName'],
      cityId: json['cityId'],
      cityName: json['cityName'],
      tourName: json['tourName'],
      reviewCount: json['reviewCount'],
      rating: json['rating'].toDouble(),
      duration: json['duration'],
      departurePoint: json['departurePoint'],
      reportingTime: json['reportingTime'],
      tourLanguage: json['tourLanguage'],
      imagePath: json['imagePath'],
      imageCaptionName: json['imageCaptionName'],
      cityTourTypeId: json['cityTourTypeId'],
      cityTourType: json['cityTourType'],
      tourDescription: json['tourDescription'],
      tourInclusion: json['tourInclusion'],
      tourShortDescription: json['tourShortDescription'],
      raynaToursAdvantage: json['raynaToursAdvantage'],
      whatsInThisTour: json['whatsInThisTour'],
      importantInformation: json['importantInformation'],
      itenararyDescription: json['itenararyDescription'],
      usefulInformation: json['usefulInformation'],
      termsAndConditions: json['termsAndConditions'],
      cancellationPolicyName: json['cancellationPolicyName'],
      cancellationPolicyDescription: json['cancellationPolicyDescription'],
      childCancellationPolicyName: json['childCancellationPolicyName'],
      childCancellationPolicyDescription:
          json['childCancellationPolicyDescription'],
      childAge: json['childAge'],
      infantAge: json['infantAge'],
      infantCount: json['infantCount'],
      isSlot: json['isSlot'],
      onlyChild: json['onlyChild'],
      contractId: json['contractId'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      startTime: json['startTime'],
      meal: json['meal'],
      videoUrl: json['videoUrl'],
      googleMapUrl: json['googleMapUrl'],
      tourExclusion: json['tourExclusion'],
      howToRedeem: json['howToRedeem'],
      tourImages: tourImages,
      tourReview: tourReview,
      questions: json['questions'],
    );
  }
}

class TourImage {
  int tourId;
  String imagePath;
  String imageCaptionName;
  int isFrontImage;
  int isBannerImage;
  int isBannerRotateImage;

  TourImage({
    required this.tourId,
    required this.imagePath,
    required this.imageCaptionName,
    required this.isFrontImage,
    required this.isBannerImage,
    required this.isBannerRotateImage,
  });

  factory TourImage.fromJson(Map<String, dynamic> json) {
    return TourImage(
      tourId: json['tourId'],
      imagePath: json['imagePath'],
      imageCaptionName: json['imageCaptionName'],
      isFrontImage: json['isFrontImage'],
      isBannerImage: json['isBannerImage'],
      isBannerRotateImage: json['isBannerRotateImage'],
    );
  }
}

class TourReview {
  int id;
  int tourId;
  int reviewId;
  String reviewTitle;
  String reviewContent;
  String visitMonth;
  String rating;
  String imagePath;
  String guestName;

  TourReview({
    required this.id,
    required this.tourId,
    required this.reviewId,
    required this.reviewTitle,
    required this.reviewContent,
    required this.visitMonth,
    required this.rating,
    required this.imagePath,
    required this.guestName,
  });

  factory TourReview.fromJson(Map<String, dynamic> json) {
    return TourReview(
      id: json['id'],
      tourId: json['tourId'],
      reviewId: json['reviewId'],
      reviewTitle: json['reviewTitle'],
      reviewContent: json['reviewContent'],
      visitMonth: json['visitMonth'],
      rating: json['rating'],
      imagePath: json['imagePath'],
      guestName: json['guestName'],
    );
  }
}
