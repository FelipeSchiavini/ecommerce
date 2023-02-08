import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web/blocs/login/login.state.dart';
import 'package:web/models/blocs.model.dart';

class LoginCubit extends Cubit<LoginState> {
  /// The initial state of the `CounterCubit` is 0.
  LoginCubit() : super(LoginInitialState());

  login(String token) => emit(LoginSucessState(login: Login(token: token)));


  @override
  void onChange(Change<LoginState> login) {
    super.onChange(login);
    print(login.currentState.token());
  }
} 

