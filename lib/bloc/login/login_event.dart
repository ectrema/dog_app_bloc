abstract class LoginEvent {}

class LoginEventSubmit extends LoginEvent {
  final String email;
  final String password;
  
  LoginEventSubmit(
    this.email,
    this.password,
  );
}
