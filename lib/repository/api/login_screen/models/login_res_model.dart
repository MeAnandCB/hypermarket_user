// To parse this JSON data, do
//
//     final loginResModel = loginResModelFromJson(jsonString);

import 'dart:convert';

LoginResModel loginResModelFromJson(String str) =>
    LoginResModel.fromJson(json.decode(str));

String loginResModelToJson(LoginResModel data) => json.encode(data.toJson());

class LoginResModel {
  String? refresh;
  String? access;
  String? username;
  String? email;
  String? firstName;
  String? lastName;
  dynamic phone;
  bool? isStaff;
  bool? isAdmin;

  LoginResModel({
    this.refresh,
    this.access,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.phone,
    this.isStaff,
    this.isAdmin,
  });

  factory LoginResModel.fromJson(Map<String, dynamic> json) => LoginResModel(
        refresh: json["refresh"],
        access: json["access"],
        username: json["username"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],
        isStaff: json["is_staff"],
        isAdmin: json["is_admin"],
      );

  Map<String, dynamic> toJson() => {
        "refresh": refresh,
        "access": access,
        "username": username,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "is_staff": isStaff,
        "is_admin": isAdmin,
      };
}
