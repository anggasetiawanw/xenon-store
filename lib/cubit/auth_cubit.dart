import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:xenon_store/models/user_model.dart';
import 'package:xenon_store/services/auth_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void register({
    required String name,
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      emit(AuthLoading());

     UserModel user = await AuthService().register(
          name: name, username: username, email: email, password: password);

      emit(AuthSuccess(user));
    } catch (e) {
      print("Gagal di AuthCubit: $e");
      emit(AuthFailed(e.toString()));
    }
  }

  
  void login({
    required String email,
    required String password,
  }) async {
    try {
      emit(AuthLoading());

      UserModel user = await AuthService().login(
           email: email, password: password);

      emit(AuthSuccess(user));
    } catch (e) {
      print("Gagal di AuthCubit: $e");
      emit(AuthFailed(e.toString()));
    }
  }
}
