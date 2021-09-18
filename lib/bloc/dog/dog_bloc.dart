import 'package:dog_app_bloc/entities/api_response.dart';
import 'package:dog_app_bloc/entities/dog.dart';
import 'package:dog_app_bloc/repositories/dog_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dog_event.dart';
import 'dog_state.dart';

class DogBloc extends Bloc<DogEvent, DogState> {
  final DogRepository repository;
  DogBloc(
    DogState initialState, {
    required this.repository,
  }) : super(initialState);

  @override
  Stream<DogState> mapEventToState(DogEvent event) async* {
    if (event is DogEventGet) {
      ApiResponse _temp = await repository.getDog();
      List<Dog> dogList = <Dog>[];
      _temp.message?.forEach((key, value) {
        if ((value as List).isEmpty) {
          dogList.add(Dog(name: key));
        } else {
          for (var element in value) {
            dogList.add(Dog(name: '$key $element'));
          }
        }
      });
      for (var i = 0; i < dogList.length; i++) {
        dogList[i] = dogList[i].copywith(
          imageLisk: await repository
              .getImageDog(dogList[i].name?.replaceAll(' ', '/') ?? '')
              .then(
                (value) => value['message'],
              ),
        );
      }

      yield state.copywith(dogList: dogList);
    }
  }
}
