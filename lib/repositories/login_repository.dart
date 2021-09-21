import 'package:dog_app_bloc/entities/login_response.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'login_repository.g.dart';

@RestApi(baseUrl: "https://reqres.in/api")
abstract class LoginRepository {
  factory LoginRepository(Dio dio, {String baseUrl}) = _LoginRepository;

  @POST("/login")
  Future<LoginResponse> postLogin(
      @Field('email') String email, @Field('password') String password);
}
