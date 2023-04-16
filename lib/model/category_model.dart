class CategoryModel {
  String? name;
  String? image;

  CategoryModel({this.name, this.image});

  CategoryModel.formJson(Map<dynamic, dynamic> json) {
    if (json.isEmpty) {
      return;
    }
    name = json["name"];

    image = json["image"];
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'image': image};
  }
}
