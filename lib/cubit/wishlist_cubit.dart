import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:xenon_store/models/product_model.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> with ChangeNotifier {
  WishlistCubit() : super(WishlistInitial());

  List<ProductModel> _wishlist = [];
  List<ProductModel> get wishlist => _wishlist;

  set wishlist(List<ProductModel> wishlist) {
    _wishlist = wishlist;
    notifyListeners();
  }

  selectedWishlist(ProductModel product) {
    if (!isWishtlist(product)) {
      _wishlist.add(product);
      print("ka Wishlist");
    } else {
      _wishlist.removeWhere((element) => element.id == product.id);
      print("Teu ka Wishlist");
    }
    emit(WishlistSuccess(_wishlist));
    print(_wishlist);
    notifyListeners();
  }

  isWishtlist(ProductModel product) {
    if (_wishlist.indexWhere((element) => element.id == product.id) == -1) {
      return false;
    } else {
      return true;
    }
  }
}
