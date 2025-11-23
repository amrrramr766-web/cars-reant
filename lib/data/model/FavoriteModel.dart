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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['favoriteID'] = this.favoriteID;
    data['userID'] = this.userID;
    data['itemID'] = this.itemID;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
