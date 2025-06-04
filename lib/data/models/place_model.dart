class Place {
  final String placeName;

  Place({required this.placeName});

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(placeName: json['place_name']);
  }

  Map<String, dynamic> toJson() {
    return {
      'place_name': placeName,
    };
  }
}
