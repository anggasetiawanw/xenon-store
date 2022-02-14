import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:xenon_store/models/product_model.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(WishlistInitial());

  List<ProductModel> _wishlist = [];
  List<ProductModel> get wishlist => _wishlist;

  void selectedWishlist(ProductModel product) {
    if (!isWishtlist(product)) {
      _wishlist.add(product);
      print("ka Wishlist");
    } else {
      _wishlist.removeWhere((element) => element.id == product.id);
      print("Teu ka Wishlist");
    }
    emit(WishlistSuccess(_wishlist));
    print(_wishlist);
  }

  bool isWishtlist(ProductModel product) {
    int index = _wishlist.indexWhere((element) => element.id == product.id);
    if (index == -1) {
      return false;
    } else {
      return true;
    }
  }
}
