import 'package:dog_app_bloc/entities/dog.dart';

enum FieldError { empty, invalid, valid }

class DogState {
  final bool isBusy;
  final bool submissionSuccess;
  final List<Dog>? dogList;
  DogState({
    this.isBusy = false,
    this.submissionSuccess = false,
    this.dogList,
  });

  DogState copywith({
    bool? isBusy,
    bool? submissionSuccess,
    List<Dog>? dogList,
  }) =>
      DogState(
        isBusy: isBusy ?? this.isBusy,
        submissionSuccess: submissionSuccess ?? this.submissionSuccess,
        dogList: dogList ?? this.dogList,
      );
}
