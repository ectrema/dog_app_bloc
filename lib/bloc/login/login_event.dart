abstract class LoginEvent {}

class LoginEventSubmit extends LoginEvent {
  final String email;
  final String password;
  
  LoginEventSubmit(
    this.email,
    this.password,
  );
}

class LoginEventSuccess extends LoginEvent {
  final String token;
  
  LoginEventSuccess(
    this.token,
  );
}

class LoginEventEmailChanged extends LoginEvent {
  final String email;
  
  LoginEventEmailChanged(
    this.email,
  );
}

class LoginEventPasswordChanged extends LoginEvent {
  final String password;
  
  LoginEventPasswordChanged(
    this.password,
  );
}