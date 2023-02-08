import 'package:web/models/blocs.model.dart';

abstract class LoginState {
  Login login;

  LoginState({
    required this.login,
  });

  String token () {
    return login.token;
  }
}



class LoginInitialState extends LoginState {
  LoginInitialState() : super(login: Login(token: "initialState"));
}

class LoginSucessState extends LoginState {
  LoginSucessState({required Login login}) : super(login: login);
}

