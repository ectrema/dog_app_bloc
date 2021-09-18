enum FieldError { empty, invalid }

class LoginState {
  final bool isBusy;
  final FieldError emailError;
  final FieldError passwordError;
  final bool submissionSuccess;
  LoginState({
    this.isBusy = false,
    this.emailError = FieldError.empty,
    this.passwordError = FieldError.empty,
    this.submissionSuccess = false,
  });

  LoginState copywith({
    bool? isBusy,
    FieldError? emailError,
    FieldError? passwordError,
    bool? submissionSuccess,
  }) =>
      LoginState(
        isBusy: isBusy ?? this.isBusy,
        emailError: emailError ?? this.emailError,
        passwordError: passwordError ?? this.passwordError,
        submissionSuccess: submissionSuccess ?? this.submissionSuccess,
      );
}
