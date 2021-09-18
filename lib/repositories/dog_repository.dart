import 'package:dio/dio.dart';
import 'package:dog_app_bloc/entities/api_response.dart';
import 'package:retrofit/http.dart';

part 'dog_repository.g.dart';

@RestApi(baseUrl: "https://dog.ceo/api")
abstract class DogRepository {
  factory DogRepository(Dio dio, {String baseUrl}) = _DogRepository;

  @GET("/breeds/list/all")
  Future<ApiResponse> getDog();

  @GET("/breed/{breed}/images/random")
  Future<dynamic> getImageDog(@Path("breed") String breed);
}
