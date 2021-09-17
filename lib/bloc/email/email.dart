import 'package:flutter_bloc/flutter_bloc.dart';

import 'email_event.dart';
import 'email_state.dart';

class EmailBloc extends Bloc<EmailEvent, EmailState> {
  EmailBloc(EmailState initialState) : super(initialState);

  @override
  Stream<EmailState> mapEventToState(EmailEvent event) async* {
    if (event is EmailEventSubmit) {
      yield EmailState(isBusy: true);

      if (isFieldEmpty(event.email)) {
        yield EmailState(emailError: FieldError.Empty);
        return;
      }

      if (!validateEmailAddress(event.email)) {
        yield EmailState(emailError: FieldError.Invalid);
        return;
      }

      yield EmailState(submissionSuccess: true);
    }
  }

  bool isFieldEmpty(String fieldValue) => fieldValue.isEmpty;

  bool validateEmailAddress(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }
}