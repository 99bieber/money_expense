class HistoryTransactionModel {
  int index;
  String? name;
  String? category;
  DateTime? date;
  num? nominal;
  DateTime? createAt;

  HistoryTransactionModel({
    required this.index,
    this.name,
    this.category,
    this.date,
    this.nominal,
    this.createAt
  });

  factory HistoryTransactionModel.fromJson(Map<String, dynamic> json) => HistoryTransactionModel(
    index: json["index"],
    name: json["name"],
    category: json["category"],
    date: json["date"],
    nominal: json["nominal"],
    createAt: json["createAt"],
  );

  Map<String, dynamic> toJson() => {
    "index": index,
    "name": name,
    "category": category,
    "date": date,
    "nominal": nominal,
    "createAt": createAt,
  };
}
