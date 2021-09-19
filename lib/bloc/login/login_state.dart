enum FieldError { empty, invalid , valid }

class LoginState {
  final bool isBusy;
  final FieldError? emailError;
  final FieldError? passwordError;
  final String? token;
  LoginState({
    this.isBusy = false,
    this.emailError,
    this.passwordError,
    this.token,
  });

  LoginState copywith({
    bool? isBusy,
    FieldError? emailError,
    FieldError? passwordError,
    String? token,
  }) =>
      LoginState(
        isBusy: isBusy ?? this.isBusy,
        emailError: emailError ?? this.emailError,
        passwordError: passwordError ?? this.passwordError,
        token: token ?? this.token,
      );
}
