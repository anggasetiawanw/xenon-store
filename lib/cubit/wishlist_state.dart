part of 'wishlist_cubit.dart';

abstract class WishlistState extends Equatable {
  const WishlistState();

  @override
  List<Object> get props => [];
}

class WishlistInitial extends WishlistState {}


class WishlistSuccess extends WishlistState {
  final List<ProductModel> wishlist;

  WishlistSuccess(this.wishlist);

  @override
  List<Object> get props => [wishlist];
}

class WishlistFailed extends WishlistState{
  final String message;

  WishlistFailed(this.message);

  @override
  List<Object> get props => [message];
}
