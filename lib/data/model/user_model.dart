class UserModel {
  int? userID;
  String? fullName;
  String? email;
  String? phone;
  int? role;
  bool? isActive;
  String? createdAt;
  License? license; // single license (first from list)

  UserModel({
    this.userID,
    this.fullName,
    this.email,
    this.phone,
    this.role,
    this.isActive,
    this.createdAt,
    this.license,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    fullName = json['fullName']; // 🔥 FIXED
    email = json['email'];
    phone = json['phone'];
    role = json['role'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];

    // backend sends: licenses: [ { ... }, { ... } ]
    if (json['licenses'] != null &&
        json['licenses'] is List &&
        json['licenses'].isNotEmpty) {
      license = License.fromJson(json['licenses'][0]);
    } else {
      license = null;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userID'] = userID;
    data['fullName'] = fullName;
    data['email'] = email;
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
  int? id;
  String? licenseNumber;
  String? expiryDate;
  String? address;

  License({this.id, this.licenseNumber, this.expiryDate, this.address});

  License.fromJson(Map<String, dynamic> json) {
    id = json['id']; // 🔥 FIXED
    licenseNumber = json['licenseNumber']; // 🔥 matches backend
    expiryDate = json['exp_date']; // 🔥 FIXED
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['licenseNumber'] = licenseNumber;
    data['exp_date'] = expiryDate;
    data['address'] = address;
    return data;
  }
}
