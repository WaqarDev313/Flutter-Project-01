import 'dart:convert';

class User {
  String email;
  String password;
  String phone;
  bool isActive;

  User({
    required this.email,
    required this.password,
    required this.phone,
    required this.isActive,
  });

  // Convert User object to JSON format
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'phone': phone,
      'isActive': isActive,
    };
  }

  // Convert JSON map to User object
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      password: json['password'],
      phone: json['phone'],
      isActive: json['isActive'],
    );
  }
}
