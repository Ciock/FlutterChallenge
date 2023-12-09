import 'package:dio/dio.dart';

class BreedApi {
  Future<Response> tryGetBreeds() =>
      Dio().get('https://dog.ceo/api/breeds/list/all');

  Future<Response> tryGetBreedImage(String breedId) =>
      Dio().get('https://dog.ceo/api/breed/$breedId/images/random');

  Future<Response> tryGetBreedImages(String breedId) =>
      Dio().get('https://dog.ceo/api/breed/$breedId/images');

  Future<Response> tryGetSubBreedImage(String subBreedId, String breedId) =>
      Dio().get('https://dog.ceo/api/breed/$breedId/$subBreedId/images/random');

  Future<Response> tryGetSubBreedImages(String subBreedId, String breedId) =>
      Dio().get('https://dog.ceo/api/breed/$breedId/$subBreedId/images');
}
