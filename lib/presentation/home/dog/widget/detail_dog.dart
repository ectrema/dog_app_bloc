import 'package:dog_app_bloc/entities/dog.dart';
import 'package:flutter/material.dart';

class DetailDog extends StatefulWidget {
  final Dog dog;
  const DetailDog({
    Key? key,
    required this.dog,
  }) : super(key: key);

  @override
  _DetailDogState createState() => _DetailDogState();
}

class _DetailDogState extends State<DetailDog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.dog.name!),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Image.network(
                widget.dog.imageLisk!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Text(
              'this dog is a ' + widget.dog.name!,
            ),
          ),
        ],
      ),
    );
  }
}
