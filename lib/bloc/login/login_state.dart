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
  @override
  String toString() {
    return '$emailError';
  }

  @override
  bool operator ==(other) {
    if(other is LoginState){
      return other.isBusy == isBusy && emailError == other.emailError && other.passwordError == passwordError && token == other.token;
    } else {
      return other == this;
    }
  }

  @override
  // TODO: implement hashCode
  int get hashCode => identityHashCode('${isBusy.hashCode} ${emailError.toString()} ${passwordError.toString()} $token');
  
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
