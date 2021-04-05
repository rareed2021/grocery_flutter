part of 'auth_cubit.dart';

@immutable
abstract class AuthState {
  User get user => null;
}

class AuthLogout extends AuthState {
}
class AuthBegun extends AuthState{}
class AuthLoggedIn extends AuthState{
  final User _user;
  AuthLoggedIn(this._user);
  @override
  User get user => _user;
  @override
  String toString() {
    return "LoginSuccess $user";
  }
}
class AuthError extends AuthState{
  final String msg;
  AuthError(this.msg);

  @override
  String toString() {
    return "LoginError $msg";
  }
}