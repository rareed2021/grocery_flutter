import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grocery_flutter/data/repositories/AuthRepository.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {

  final AuthRepository repository;
  AuthCubit(this.repository):super(AuthLogout());


  void registerUser(email,password,name,phone){
    emit(AuthBegun());
    final fut = repository.register(email, password, name, phone);
    fut.then((user) => emit(AuthLoggedIn(user)))
        .onError((error, stackTrace) => emit(AuthError(error.toString())));
  }


  void loginUser(String email, String password){
    final userFut =repository.login(email, password);
    userFut.then((value) => this.emit(AuthLoggedIn(value)))
        .onError((error, stackTrace) => this.emit(AuthError(error.toString())));
  }

  void logout(){
    repository.logout();
    emit(AuthLogout());
  }
}

