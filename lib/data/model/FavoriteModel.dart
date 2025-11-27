class FavoriteModel {
  int? favoriteID;
  int? userID;
  int? itemID;
  String? createdAt;

  FavoriteModel({this.favoriteID, this.userID, this.itemID, this.createdAt});

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    favoriteID = json['favoriteID'];
    userID = json['userID'];
    itemID = json['itemID'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['favoriteID'] = favoriteID;
    data['userID'] = userID;
    data['itemID'] = itemID;
    data['createdAt'] = createdAt;
    return data;
  }
}
