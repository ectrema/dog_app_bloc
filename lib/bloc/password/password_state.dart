enum FieldError { Empty, Invalid }

class PasswordState {
  final bool isBusy;
  final FieldError passwordError;
  final bool submissionSuccess;
  PasswordState({
    this.isBusy = false,
    this.passwordError = FieldError.Empty,
    this.submissionSuccess = false,
  });
}