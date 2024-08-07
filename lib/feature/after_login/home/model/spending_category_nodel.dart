class SpendingCategoryModel {
  String? category;
  String? categoryId;
  num? nominal;

  SpendingCategoryModel({
    this.category,
    this.categoryId,
    this.nominal,
  });

  factory SpendingCategoryModel.fromJson(Map<String, dynamic> json) => SpendingCategoryModel(
    category: json["category"],
    categoryId: json["categoryId"],
    nominal: json["nominal"],
  );

  Map<String, dynamic> toJson() => {
    "category": category,
    "categoryId": categoryId,
    "nominal": nominal,
  };
}
