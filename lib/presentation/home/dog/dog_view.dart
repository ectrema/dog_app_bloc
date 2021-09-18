import 'package:dio/dio.dart';
import 'package:dog_app_bloc/bloc/dog/dog_bloc.dart';
import 'package:dog_app_bloc/bloc/dog/dog_event.dart';
import 'package:dog_app_bloc/bloc/dog/dog_state.dart';
import 'package:dog_app_bloc/entities/dog.dart';
import 'package:dog_app_bloc/presentation/home/dog/widget/detail_dog.dart';
import 'package:dog_app_bloc/repositories/dog_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DogView extends StatefulWidget {
  const DogView({Key? key}) : super(key: key);

  @override
  State<DogView> createState() => _DogViewState();
}

class _DogViewState extends State<DogView> {
  DogBloc? dogBloc;

  @override
  void initState() {
    dogBloc = DogBloc(
      DogState(),
      repository: DogRepository(
        Dio(),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    dogBloc!.add(DogEventGet());
    return BlocBuilder<DogBloc, DogState>(
      bloc: dogBloc,
      builder: (context, state) => state.dogList?.isNotEmpty ?? false
          ? _buildDogList(state)
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  Widget _buildDogList(DogState state) {
    return SingleChildScrollView(
      child: Wrap(
        children: List.generate(
          state.dogList!.length,
          (index) => _buildDogItem(state.dogList![index]),
        ),
      ),
    );
  }

  Widget _buildDogItem(Dog dog) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailDog(dog: dog),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              dog.name!.toUpperCase(),
            ),
            Image.network(
              dog.imageLisk ?? '',
              fit: BoxFit.fill,
              height: 150,
            )
          ],
        ),
      ),
    );
  }
}
