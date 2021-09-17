abstract class EmailEvent {}

class EmailEventSubmit extends EmailEvent {
  final String email;
  EmailEventSubmit(this.email);
}