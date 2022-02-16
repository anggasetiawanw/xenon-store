import 'package:xenon_store/models/product_model.dart';

class CartModel {
  int id;
  ProductModel product;
  int quantity;

  CartModel({
    this.id = 0,
    required this.product,
    this.quantity = 0,
  });

  factory CartModel.fromJson(Map<String,dynamic>json) =>CartModel(
    id: json['id'],
    product: ProductModel.fromJson(json['product']),
    quantity: json['quantity'],
  );

  Map<String,dynamic> toJson(){
    return {
      'id': id,
      'product': product.toJson(),
      'quantity': quantity,
    };
  }

  int getTotalPrice(){
    return product.price * quantity;
  }
}
