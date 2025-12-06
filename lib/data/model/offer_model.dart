class OfferModel {
  final int id;
  final String description;
  final int persenteg;
  final String imageUrl;
  final DateTime endDate;

  OfferModel({
    required this.id,
    required this.description,
    required this.persenteg,
    required this.imageUrl,
    required this.endDate,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      id: json['id'] ?? 0,
      description: json['discreption'] ?? '', // مطابق للمفتاح من API
      persenteg: json['persenteg'] ?? 0,
      imageUrl:
          json['imageUrl'] ??
          '', // ✅ Fixed: API returns 'imageUrl' not 'imageURL'
      endDate: DateTime.parse(json['endDate']),
    );
  }
}
