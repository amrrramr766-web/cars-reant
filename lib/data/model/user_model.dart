class UserModel {
  int? userID;
  String? name;
  String? email;
  String? password;
  String? phone;
  int? role;
  bool? isActive;
  String? createdAt;
  License? license;

  UserModel({
    this.userID,
    this.name,
    this.email,
    this.password,
    this.phone,
    this.role,
    this.isActive,
    this.createdAt,
    this.license,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    role = json['role'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    license = json['license'] != null
        ? License.fromJson(json['license'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userID'] = userID;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['phone'] = phone;
    data['role'] = role;
    data['isActive'] = isActive;
    data['createdAt'] = createdAt;
    if (license != null) {
      data['license'] = license!.toJson();
    }
    return data;
  }
}

class License {
  int? licenseID;
  int? userID;
  String? licenseNumber;
  String? expiryDate;
  String? address;

  License({
    this.licenseID,
    this.userID,
    this.licenseNumber,
    this.expiryDate,
    this.address,
  });

  License.fromJson(Map<String, dynamic> json) {
    licenseID = json['licenseID'];
    userID = json['userID'];
    licenseNumber = json['licenseNumber'];
    expiryDate = json['expiryDate'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['licenseID'] = licenseID;
    data['userID'] = userID;
    data['licenseNumber'] = licenseNumber;
    data['expiryDate'] = expiryDate;
    data['address'] = address;
    return data;
  }
}
