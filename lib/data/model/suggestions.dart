class SuggestionsModel {
  int? id;
  String? title;
  int? carId;
  double? presPerDay;
  String? category;
  bool? isActive;
  String? createdAt;
  String? carName;

  SuggestionsModel({
    this.id,
    this.title,
    this.carId,
    this.presPerDay,
    this.category,
    this.isActive,
    this.createdAt,
    this.carName,
  });

  SuggestionsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    carId = json['carId'];
    presPerDay = json['presPerDay'] != null
        ? (json['presPerDay'] as num).toDouble()
        : null;
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    carName = json['carName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['carId'] = carId;
    data['presPerDay'] = presPerDay;
    data['category'] = category;
    data['isActive'] = isActive;
    data['createdAt'] = createdAt;
    data['carName'] = carName;
    return data;
  }
}
