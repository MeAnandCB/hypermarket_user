class PurchaseScreenResModel {
  int? status;
  List<PurchaseRes>? purchaseData;

  PurchaseScreenResModel({
    this.status,
    this.purchaseData,
  });

  factory PurchaseScreenResModel.fromJson(Map<String, dynamic> json) =>
      PurchaseScreenResModel(
        status: json["status"],
        purchaseData: json["data"] == null
            ? []
            : List<PurchaseRes>.from(
                json["data"]!.map((x) => PurchaseRes.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": purchaseData == null
            ? []
            : List<dynamic>.from(purchaseData!.map((x) => x.toJson())),
      };
}

class PurchaseRes {
  int? id;
  String? user;
  String? product;
  int? quantity;
  DateTime? orderDate;
  String? totalAmount;
  bool? isCompleted;

  PurchaseRes({
    this.id,
    this.user,
    this.product,
    this.quantity,
    this.orderDate,
    this.totalAmount,
    this.isCompleted,
  });

  factory PurchaseRes.fromJson(Map<String, dynamic> json) => PurchaseRes(
        id: json["id"],
        user: json["user"],
        product: json["product"],
        quantity: json["quantity"],
        orderDate: json["order_date"] == null
            ? null
            : DateTime.parse(json["order_date"]),
        totalAmount: json["total_amount"],
        isCompleted: json["is_completed"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user,
        "product": product,
        "quantity": quantity,
        "order_date": orderDate?.toIso8601String(),
        "total_amount": totalAmount,
        "is_completed": isCompleted,
      };
}
