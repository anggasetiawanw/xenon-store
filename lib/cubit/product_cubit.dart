import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:xenon_store/models/product_model.dart';
import 'package:xenon_store/services/product_service.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  void getProducts() async {
    try {
      emit(ProductLoading());

      List<ProductModel> products = await ProductService().getProduct();

      print(products);

      emit(ProductSuccess(products));
    } catch (e) {
      emit(ProductFailed(e.toString()));
    }
  }
}
