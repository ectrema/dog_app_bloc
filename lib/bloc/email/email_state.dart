enum FieldError { Empty, Invalid }

class EmailState {
  final bool isBusy;
  final FieldError emailError;
  final bool submissionSuccess;
  EmailState({
    this.isBusy = false,
    this.emailError = FieldError.Empty,
    this.submissionSuccess = false,
  });
}