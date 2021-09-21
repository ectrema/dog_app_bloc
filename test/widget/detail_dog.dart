import 'dart:io';

import 'package:dog_app_bloc/entities/dog.dart';
import 'package:dog_app_bloc/presentation/home/dog/widget/detail_dog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(() => HttpOverrides.global = null);
  testWidgets('MyWidget has a title and message', (WidgetTester tester) async {
    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(),
        child: MaterialApp(
          home: DetailDog(
            dog: Dog(
              name: 'husky',
              imageLisk: 'https://www.google.com/imgres?imgurl=http%3A%2F%2Fnosamisleschiens.fr%2Fwp-content%2Fuploads%2F2016%2F10%2FHusky-Sibe%25CC%2581rien-scaled-scaled.jpeg&imgrefurl=https%3A%2F%2Fnosamisleschiens.fr%2Fhusky-de-siberie%2F&tbnid=T0C_3uM6DAIepM&vet=12ahUKEwiBvc7woI7zAhVRSxoKHQgFDgEQMygBegUIARDTAQ..i&docid=DojRemNxsLwNPM&w=2560&h=1924&q=husky&client=safari&ved=2ahUKEwiBvc7woI7zAhVRSxoKHQgFDgEQMygBegUIARDTAQ',
            ),
          ),
        ),
      ),
    );

    final titleFinder = find.text('husky');
    final messageFinder = find.text('this dog is a husky');

    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });
}
