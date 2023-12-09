part of 'breed.service.dart';

extension BreedActions on BreedService {
  Future<void> getBreeds() async {
    final response = await _breedApi.tryGetBreeds();

    _breeds.value = (response.data['message'] as Map)
        .entries
        .map(BreedModel.fromGetBreedsResponse)
        .toList();
  }

  Future<void> updateBreedImage(BreedModel breed) async {
    if (breed.id == null) return;

    final response = await _breedApi.tryGetBreedImage(breed.id!);

    breed.image = response.data['message'];
  }

  Future<void> updateBreedImages(BreedModel breed) async {
    if (breed.id == null) return;

    final response = await _breedApi.tryGetBreedImages(breed.id!);

    breed.images =
        (response.data['message'] as List).map((e) => e.toString()).toList();
  }
}
