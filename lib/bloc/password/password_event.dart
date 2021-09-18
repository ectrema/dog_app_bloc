abstract class PasswordEvent {}

class PasswordEventSubmit extends PasswordEvent {
  final String password;
  PasswordEventSubmit(this.password);
}