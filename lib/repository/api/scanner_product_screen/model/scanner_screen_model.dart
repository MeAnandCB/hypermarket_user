import 'dart:convert';

ScannedProductDetailsResModel productDetailsResModelFromJson(String str) =>
    ScannedProductDetailsResModel.fromJson(json.decode(str));

String productDetailsResModelToJson(ScannedProductDetailsResModel data) =>
    json.encode(data.toJson());

class ScannedProductDetailsResModel {
  int? status;
  String? message;
  Data? productDetalsData;

  ScannedProductDetailsResModel({
    this.status,
    this.message,
    this.productDetalsData,
  });

  factory ScannedProductDetailsResModel.fromJson(Map<String, dynamic> json) =>
      ScannedProductDetailsResModel(
        status: json["status"],
        message: json["message"],
        productDetalsData:
            json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": productDetalsData?.toJson(),
      };
}

class Data {
  int? id;
  String? name;
  Category? category;
  String? description;
  String? price;
  String? offerprice;
  int? quantity;
  bool? isOutOfStock;
  String? qrCode;
  String? image;

  Data({
    this.id,
    this.name,
    this.category,
    this.description,
    this.price,
    this.offerprice,
    this.quantity,
    this.isOutOfStock,
    this.qrCode,
    this.image,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        description: json["description"],
        price: json["price"],
        offerprice: json["offerprice"],
        quantity: json["quantity"],
        isOutOfStock: json["is_out_of_stock"],
        qrCode: json["qr_code"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category": category?.toJson(),
        "description": description,
        "price": price,
        "offerprice": offerprice,
        "quantity": quantity,
        "is_out_of_stock": isOutOfStock,
        "qr_code": qrCode,
        "image": image,
      };
}

class Category {
  int? id;
  String? name;
  String? image;

  Category({
    this.id,
    this.name,
    this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
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
