abstract class DogEvent {}

class DogEventGet extends DogEvent {}

class DogEventSuccess extends DogEvent {
  final bool isSuccess;
  
  DogEventSuccess(
    this.isSuccess,
  );
}