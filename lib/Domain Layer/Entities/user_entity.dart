import 'package:equatable/equatable.dart';
import 'license_entity.dart';

/// User Entity - Pure business object without JSON dependencies
class UserEntity extends Equatable {
  final int id;
  final String fullName;
  final String email;
  final String phone;
  final UserRole role;
  final bool isActive;
  final DateTime createdAt;
  final LicenseEntity? license;

  const UserEntity({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.role,
    required this.isActive,
    required this.createdAt,
    this.license,
  });

  // Business logic methods

  /// Checks if user has a valid license for renting
  bool hasValidLicense() {
    return license != null && license!.isValid();
  }

  /// Checks if user is an admin
  bool isAdmin() {
    return role == UserRole.admin;
  }

  /// Checks if user is a regular customer
  bool isCustomer() {
    return role == UserRole.customer;
  }

  /// Checks if user can rent a car
  bool canRentCar() {
    return isActive && hasValidLicense();
  }

  /// Gets user's first name
  String get firstName {
    final parts = fullName.split(' ');
    return parts.isNotEmpty ? parts.first : fullName;
  }

  /// Gets user's last name
  String get lastName {
    final parts = fullName.split(' ');
    return parts.length > 1 ? parts.last : '';
  }

  @override
  List<Object?> get props => [
    id,
    fullName,
    email,
    phone,
    role,
    isActive,
    createdAt,
    license,
  ];
}

/// User role enumeration
enum UserRole {
  customer(0),
  admin(1);

  final int value;
  const UserRole(this.value);

  static UserRole fromInt(int value) {
    return UserRole.values.firstWhere(
      (role) => role.value == value,
      orElse: () => UserRole.customer,
    );
  }
}
