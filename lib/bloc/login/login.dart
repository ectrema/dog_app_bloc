import 'package:dog_app_bloc/repositories/login_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository repository;
  LoginBloc(
    LoginState initialState, {
    required this.repository,
  }) : super(initialState);

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginEventSubmit) {
      yield state.copywith(isBusy: true);

      if (isFieldEmpty(event.email)) {
        yield state.copywith(emailError: FieldError.empty);
      }

      if (!validateEmailAddress(event.email)) {
        yield state.copywith(emailError: FieldError.invalid);
      }

      if (!validatePassword(event.password)) {
        yield state.copywith(passwordError: FieldError.invalid);
      }

      yield state.copywith(submissionSuccess: true);
      await repository
          .login(
            email: event.email,
            password: event.password,
          )
          .then((value) => print(value));
      yield state.copywith(isBusy: false);

    }
  }

  bool isFieldEmpty(String fieldValue) => fieldValue.isEmpty;

  bool validateEmailAddress(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  bool validatePassword(String password) {
    return password.length >= 8;
  }
}
