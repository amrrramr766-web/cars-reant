class LicenseModel {
  final int id;
  final String licenseNumber;
  final DateTime expiryDate;
  final String address;

  const LicenseModel({
    required this.id,
    required this.licenseNumber,
    required this.expiryDate,
    required this.address,
  });
}
