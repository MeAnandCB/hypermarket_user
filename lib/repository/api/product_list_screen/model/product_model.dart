// class ProductScreenModel {
//   String? status;
//   String? message;
//   List<DataRes>? productData;

//   ProductScreenModel({
//     this.status,
//     this.message,
//     this.productData,
//   });

//   factory ProductScreenModel.fromJson(Map<String, dynamic> json) =>
//       ProductScreenModel(
//         status: json["status"],
//         message: json["message"],
//         productData: json["data"] == null
//             ? []
//             : List<DataRes>.from(json["data"]!.map((x) => DataRes.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "message": message,
//         "data": productData == null
//             ? []
//             : List<dynamic>.from(productData!.map((x) => x.toJson())),
//       };
// }

// class DataRes {
//   int? id;
//   String? name;
//   Category? category;
//   String? description;
//   String? price;
//   String? offerprice;
//   int? quantity;
//   bool? isOutOfStock;
//   dynamic qrCode;
//   String? image;

//   DataRes({
//     this.id,
//     this.name,
//     this.category,
//     this.description,
//     this.price,
//     this.offerprice,
//     this.quantity,
//     this.isOutOfStock,
//     this.qrCode,
//     this.image,
//   });

//   factory DataRes.fromJson(Map<String, dynamic> json) => DataRes(
//         id: json["id"],
//         name: json["name"],
//         category: json["category"] == null
//             ? null
//             : Category.fromJson(json["category"]),
//         description: json["description"],
//         price: json["price"],
//         offerprice: json["offerprice"],
//         quantity: json["quantity"],
//         isOutOfStock: json["is_out_of_stock"],
//         qrCode: json["qr_code"],
//         image: json["image"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "category": category?.toJson(),
//         "description": description,
//         "price": price,
//         "offerprice": offerprice,
//         "quantity": quantity,
//         "is_out_of_stock": isOutOfStock,
//         "qr_code": qrCode,
//         "image": image,
//       };
// }

// class Category {
//   int? id;
//   String? name;
//   String? image;

//   Category({
//     this.id,
//     this.name,
//     this.image,
//   });

//   factory Category.fromJson(Map<String, dynamic> json) => Category(
//         id: json["id"],
//         name: json["name"],
//         image: json["image"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "image": image,
//       };
// }

// To parse this JSON data, do
//
//     final productListResModel = productListResModelFromJson(jsonString);

class ProductScreenModel {
  int? status;
  String? message;
  List<DataRes>? productData;

  ProductScreenModel({
    this.status,
    this.message,
    this.productData,
  });

  factory ProductScreenModel.fromJson(Map<String, dynamic> json) =>
      ProductScreenModel(
        status: json["status"],
        message: json["message"],
        productData: json["data"] == null
            ? []
            : List<DataRes>.from(json["data"]!.map((x) => DataRes.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": productData == null
            ? []
            : List<dynamic>.from(productData!.map((x) => x.toJson())),
      };
}

class DataRes {
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

  DataRes({
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

  factory DataRes.fromJson(Map<String, dynamic> json) => DataRes(
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
