class FavorateScreenResModel {
  int? status;
  List<FavorateData>? favorateData;

  FavorateScreenResModel({
    this.status,
    this.favorateData,
  });

  factory FavorateScreenResModel.fromJson(Map<String, dynamic> json) =>
      FavorateScreenResModel(
        status: json["status"],
        favorateData: json["data"] == null
            ? []
            : List<FavorateData>.from(
                json["data"]!.map((x) => FavorateData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": favorateData == null
            ? []
            : List<dynamic>.from(favorateData!.map((x) => x.toJson())),
      };
}

class FavorateData {
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

  FavorateData({
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

  factory FavorateData.fromJson(Map<String, dynamic> json) => FavorateData(
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
