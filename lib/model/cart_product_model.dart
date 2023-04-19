class CartProductModel {
  String? name, image, price, productId;

  int quantity = 1;

  CartProductModel(
      {this.name, this.image, this.price,required this.quantity, this.productId});

  CartProductModel.fromJson(Map<dynamic, dynamic> json) {
    if (json.isEmpty) {
      return;
    }
    name = json["name"];
    image = json["image"];
    price = json["price"];
    productId = json["productId"];
    quantity = json["quantity"];
    
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'price': price,
      'productId' : productId,
      'quantity': quantity,
      
    };
  }
}
