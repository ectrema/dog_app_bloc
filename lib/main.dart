import 'package:dog_app_bloc/presentation/home/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Dog App with Bloc',
      debugShowCheckedModeBanner: false,
      home: Home(),
    ),
  );
}
