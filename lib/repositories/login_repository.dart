import 'dart:convert';

import 'package:dio/dio.dart';

class LoginRepository {
  final Dio client;

  LoginRepository({required this.client});

  Future<bool> login({String? email, String? password}) async {
    Response response = await client.post(
      '/login',
      data: jsonEncode({
        'email': email,
        'password': password
      }),
    );
    return response.statusCode == 200;
  }
}
