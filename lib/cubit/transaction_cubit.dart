import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:xenon_store/models/cart_model.dart';
import 'package:xenon_store/services/transaction_service.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());
  checkout(
      String token, List<CartModel> carts, int totalPrice) async {
    try {
      if (await TransactionService().checkout(token, carts, totalPrice)) {
        emit(const TransactionSuccess(true));
        return true;
      } else {
        emit(const TransactionSuccess(false));
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }  
}
