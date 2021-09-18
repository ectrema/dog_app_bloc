import 'package:flutter_bloc/flutter_bloc.dart';

import 'password_event.dart';
import 'password_state.dart';

class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  PasswordBloc(PasswordState initialState) : super(initialState);

  @override
  Stream<PasswordState> mapEventToState(PasswordEvent event) async* {
    if (event is PasswordEventSubmit) {
      yield PasswordState(isBusy: true);

      if (isFieldEmpty(event.password)) {
        yield PasswordState(passwordError: FieldError.Empty);
        return;
      }

      if (!validatePasswordAddress(event.password)) {
        yield PasswordState(passwordError: FieldError.Invalid);
        return;
      }

      yield PasswordState(submissionSuccess: true);
    }
  }

  bool isFieldEmpty(String fieldValue) => fieldValue.isEmpty;

  bool validatePasswordAddress(String password) {
    return password.length >= 8;
  }
}