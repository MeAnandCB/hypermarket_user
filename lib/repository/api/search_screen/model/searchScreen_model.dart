class SearchScreenResModel {
  int? status;
  String? message;
  List<SearchScreenData>? searchdata;

  SearchScreenResModel({
    this.status,
    this.message,
    this.searchdata,
  });

  factory SearchScreenResModel.fromJson(Map<String, dynamic> json) =>
      SearchScreenResModel(
        status: json["status"],
        message: json["message"],
        searchdata: json["data"] == null
            ? []
            : List<SearchScreenData>.from(
                json["data"]!.map((x) => SearchScreenData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": searchdata == null
            ? []
            : List<dynamic>.from(searchdata!.map((x) => x.toJson())),
      };
}

class SearchScreenData {
  int? id;
  String? name;
  String? image;

  SearchScreenData({
    this.id,
    this.name,
    this.image,
  });

  factory SearchScreenData.fromJson(Map<String, dynamic> json) =>
      SearchScreenData(
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
