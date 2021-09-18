import 'package:dio/dio.dart';
import 'package:dog_app_bloc/entities/dog.dart';
import 'package:retrofit/http.dart';

part 'dog_repository.g.dart';

@RestApi(baseUrl: "https://dog.ceo/api")
abstract class DogRepository {
  factory DogRepository(Dio dio, {String baseUrl}) = _DogRepository;

  @GET("/breeds/list/all")
  Future<dynamic> getDog();
}
