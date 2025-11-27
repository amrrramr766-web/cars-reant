class FavorCarsModel {
  int? favoriteID;
  int? userID;
  int? itemID;
  String? createdAt;
  String? itemName;
  int? pricePerDay;
  bool? isAvailable;
  String? imageURL;
  String? gas;
  String? gear;

  FavorCarsModel({
    this.favoriteID,
    this.userID,
    this.itemID,
    this.createdAt,
    this.itemName,
    this.pricePerDay,
    this.isAvailable,
    this.imageURL,
    this.gas,
    this.gear,
  });

  FavorCarsModel.fromJson(Map<String, dynamic> json) {
    favoriteID = json['favoriteID'];
    userID = json['userID'];
    itemID = json['itemID'];
    createdAt = json['createdAt'];
    itemName = json['itemName'];
    pricePerDay = json['pricePerDay'];
    isAvailable = json['isAvailable'];
    imageURL = json['imageURL'];
    gas = json['gas'];
    gear = json['gear'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['favoriteID'] = favoriteID;
    data['userID'] = userID;
    data['itemID'] = itemID;
    data['createdAt'] = createdAt;
    data['itemName'] = itemName;
    data['pricePerDay'] = pricePerDay;
    data['isAvailable'] = isAvailable;
    data['imageURL'] = imageURL;
    data['gas'] = gas;
    data['gear'] = gear;
    return data;
  }
}
