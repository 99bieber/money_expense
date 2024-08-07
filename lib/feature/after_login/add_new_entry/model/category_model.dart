class CategoryModel {
  String? name;
  String? category;

  CategoryModel({
    this.name,
    this.category,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        name: json["name"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "category": category,
      };
}
