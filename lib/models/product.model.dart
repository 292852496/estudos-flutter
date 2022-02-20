class ProductModel {
  int? id;
  String? title;

  ProductModel({required this.title, required this.id}) {}

  ProductModel.fromJSON(Map<String, dynamic> jsonObject) {
    id = jsonObject['id'];
    title = jsonObject['title'];
  }

  Map<String, dynamic> toJSON() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    return data;
  }
}
