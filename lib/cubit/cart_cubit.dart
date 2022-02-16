import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:xenon_store/models/cart_model.dart';
import 'package:xenon_store/models/product_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> with ChangeNotifier {
  CartCubit() : super(CartInitial());

  List<CartModel> _carts = [];

  List<CartModel> get carts => _carts;

  set carts(List<CartModel> carts) {
    _carts = carts;
    notifyListeners();
  }

  addToCart(ProductModel product) {
    if (productExist(product)) {
      int index =
          _carts.indexWhere((element) => element.product.id == product.id);
      _carts[index].quantity++;
    } else {
      _carts.add(CartModel(
        product: product,
        id: _carts.length,
        quantity: 1,
      ));
    }
    emit(CartSuccess(_carts));
    notifyListeners();
  }

  removeItem(int id) {
    _carts.removeAt(id);
    notifyListeners();
  }

  addQuantity(int id) {
    _carts[id].quantity++;
    notifyListeners();
  }

  removeAllCart() {
    _carts = [];
    notifyListeners();
  }

  reduceQuantity(int id) {
    _carts[id].quantity--;
    if (_carts[id].quantity == 0) {
      removeItem(id);
    }
    notifyListeners();
  }

  totalItems() {
    int total = 0;
    for (var item in _carts) {
      total += item.quantity;
    }
    return total;
  }

  totalPrice() {
    int total = 0;
    for (var item in _carts) {
      total += (item.product.price * item.quantity);
    }
    return total;
  }

  productExist(ProductModel product) {
    if (_carts.indexWhere((element) => element.id == product.id) == -1) {
      return false;
    } else {
      return true;
    }
  }
}
