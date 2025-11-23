class SuggestionsModel {
  final int? id;
  final String? title;
  final int? carId;
  final String? category;
  final bool? isActive;
  final String? createdAt;
  final String? carName;

  SuggestionsModel({
    this.id,
    this.title,
    this.carId,
    this.category,
    this.isActive,
    this.createdAt,
    this.carName,
  });

  factory SuggestionsModel.fromJson(Map<String, dynamic> json) {
    return SuggestionsModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      carId: json['carId'] as int?,
      category: json['category'] as String?,
      isActive: json['isActive'] as bool?,
      createdAt: json['createdAt'] as String?,
      carName: json['carName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'carId': carId,
      'category': category,
      'isActive': isActive,
      'createdAt': createdAt,
      'carName': carName,
    };
  }
}
