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

      if (state.passwordError == FieldError.valid &&
          state.emailError == FieldError.valid) {
        try {
          await repository
              .login(
            email: event.email,
            password: event.password,
          )
              .then((value) {
            add(LoginEventSuccess(value));
          });
        } catch (e) {
          yield state.copywith(isBusy: false);
          add(LoginEventSuccess(false));
          rethrow;
        }
      }
      yield state.copywith(isBusy: false);
    } else if (event is LoginEventSuccess) {
      yield state.copywith(submissionSuccess: event.isSuccess);
    } else if (event is LoginEventEmailChanged) {
      if (isFieldEmpty(event.email)) {
        yield state.copywith(emailError: FieldError.empty);
      } else if (!validateEmailAddress(event.email)) {
        yield state.copywith(emailError: FieldError.invalid);
      } else {
        yield state.copywith(emailError: FieldError.valid);
      }
    } else if (event is LoginEventPasswordChanged) {
      if (!validatePassword(event.password)) {
        yield state.copywith(passwordError: FieldError.invalid);
      } else {
        yield state.copywith(passwordError: FieldError.valid);
      }
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
