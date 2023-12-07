import 'package:dio/dio.dart';

class BreedApi {
  Future<Response> tryGetBreeds() =>
      Dio().get('https://dog.ceo/api/breeds/list/all');

  Future<Response> tryGetBreedImage(String breedName) =>
      Dio().get('https://dog.ceo/api/breed/$breedName/images/random');
}
