import 'package:xenon_store/models/cart_model.dart';

class TransactionModel {
  String token;
  CartModel cart;
  int totalPrice;

  TransactionModel({required this.token, required this.cart, required this.totalPrice});
}
