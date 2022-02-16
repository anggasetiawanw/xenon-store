part of 'cart_cubit.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartSuccess extends CartState {
  final List<CartModel> carts;

  const CartSuccess(this.carts);

  @override
  List<Object> get props => [carts];
}

class CartFailed extends CartState {
  final String message;

  const CartFailed(this.message);

  @override
  List<Object> get props => [message];
}
