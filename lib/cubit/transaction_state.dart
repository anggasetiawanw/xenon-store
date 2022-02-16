part of 'transaction_cubit.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object> get props => [];
}

class TransactionInitial extends TransactionState {}

class TransactionLoading extends  TransactionState {}

class TransactionSuccess extends  TransactionState {
  final bool transaction;

  const TransactionSuccess(this.transaction);

  @override
  List<Object> get props => [transaction];
}

class TransactionFailed extends  TransactionState {
  final String message;

  const TransactionFailed(this.message);

  @override
  List<Object> get props => [message];
}
