// To parse this JSON data, do
//
//     final categoryListResModel = categoryListResModelFromJson(jsonString);

import 'dart:convert';

CategoryListResModel categoryListResModelFromJson(String str) =>
    CategoryListResModel.fromJson(json.decode(str));

String categoryListResModelToJson(CategoryListResModel data) =>
    json.encode(data.toJson());

class CategoryListResModel {
  int? status;
  String? message;
  List<Data>? responseData;

  CategoryListResModel({
    this.status,
    this.message,
    this.responseData,
  });

  factory CategoryListResModel.fromJson(Map<String, dynamic> json) =>
      CategoryListResModel(
        status: json["status"],
        message: json["message"],
        responseData: json["data"] == null
            ? []
            : List<Data>.from(json["data"]!.map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": responseData == null
            ? []
            : List<dynamic>.from(responseData!.map((x) => x.toJson())),
      };
}

class Data {
  int? id;
  String? name;
  String? image;

  Data({
    this.id,
    this.name,
    this.image,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
}
