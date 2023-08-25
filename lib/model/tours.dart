class TourModel {
  final int tourId;
  final int countryId;
  final String countryName;
  final int cityId;
  final String cityName;
  final String tourName;
  final int reviewCount;
  final double rating;
  final String duration;
  final String imagePath;
  final String imageCaptionName;
  final String cityTourTypeId;
  final String cityTourType;
  final String tourShortDescription;
  final String cancellationPolicyName;
  final bool isSlot;
  final bool onlyChild;
  final int contractId;
  final bool recommended;
  final bool isPrivate;

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
    required this.imagePath,
    required this.imageCaptionName,
    required this.cityTourTypeId,
    required this.cityTourType,
    required this.tourShortDescription,
    required this.cancellationPolicyName,
    required this.isSlot,
    required this.onlyChild,
    required this.contractId,
    required this.recommended,
    required this.isPrivate,
  });

  factory TourModel.fromJson(Map<String, dynamic> json) {
    return TourModel(
      tourId: json['tourId'],
      countryId: json['countryId'],
      countryName: json['countryName'],
      cityId: json['cityId'],
      cityName: json['cityName'],
      tourName: json['tourName'],
      reviewCount: json['reviewCount'],
      rating: json['rating'],
      duration: json['duration'],
      imagePath: json['imagePath'],
      imageCaptionName: json['imageCaptionName'],
      cityTourTypeId: json['cityTourTypeId'],
      cityTourType: json['cityTourType'],
      tourShortDescription: json['tourShortDescription'],
      cancellationPolicyName: json['cancellationPolicyName'],
      isSlot: json['isSlot'],
      onlyChild: json['onlyChild'],
      contractId: json['contractId'],
      recommended: json['recommended'],
      isPrivate: json['isPrivate'],
    );
  }
}
