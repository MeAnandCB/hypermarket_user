// To parse this JSON data, do
//
//     final loginResModel = loginResModelFromJson(jsonString);

import 'dart:convert';

LoginResModel loginResModelFromJson(String str) =>
    LoginResModel.fromJson(json.decode(str));

String loginResModelToJson(LoginResModel data) => json.encode(data.toJson());

class LoginResModel {
  int? status;
  Data? data;

  LoginResModel({
    this.status,
    this.data,
  });

  factory LoginResModel.fromJson(Map<String, dynamic> json) => LoginResModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
      };
}

class Data {
  Token? token;
  User? user;

  Data({
    this.token,
    this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"] == null ? null : Token.fromJson(json["token"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token?.toJson(),
        "user": user?.toJson(),
      };
}

class Token {
  String? refresh;
  String? access;

  Token({
    this.refresh,
    this.access,
  });

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        refresh: json["refresh"],
        access: json["access"],
      );

  Map<String, dynamic> toJson() => {
        "refresh": refresh,
        "access": access,
      };
}

class User {
  int? id;
  String? fullName;
  String? phone;
  String? dob;
  dynamic email;
  String? gender;
  String? userType;
  bool? isActive;

  User({
    this.id,
    this.fullName,
    this.phone,
    this.dob,
    this.email,
    this.gender,
    this.userType,
    this.isActive,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        fullName: json["full_name"],
        phone: json["phone"],
        dob: json["dob"],
        email: json["email"],
        gender: json["gender"],
        userType: json["user_type"],
        isActive: json["is_active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "phone": phone,
        "dob": dob,
        "email": email,
        "gender": gender,
        "user_type": userType,
        "is_active": isActive,
      };
}
