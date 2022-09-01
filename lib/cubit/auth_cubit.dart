import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ocp/models/user_model.dart';
import 'package:ocp/services/auth_service.dart';
import 'package:ocp/services/user_service.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  //method
  void signUp({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    try {
      emit(AuthLoading());

      //membuat objek
      UserModel user = await AuthService()
          .signUp(email: email, password: password, name: name, phone: phone);

      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFail(e.toString()));
    }
  }

  void signOut() async {
    try {
      emit(AuthLoading());
      await AuthService().signOut();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFail(e.toString()));
    }
  }

  void getCurrentUser(String id) async {
    try {
      UserModel user = await UserService().getUserById(id);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFail(e.toString()));
    }
  }

  void signIn({
    required String email,
    required String password,
  }) async {
    try {
      emit(AuthLoading());
      UserModel user = await AuthService().signIn(
        email: email,
        password: password,
      );
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFail(e.toString()));
    }
  }
}
