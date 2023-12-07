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
    if (breed.name == null) return;

    final response = await _breedApi.tryGetBreedImage(breed.name!);

    breed.image.value = response.data['message'];
  }

  Future<void> updateBreedImages(BreedModel breed) async {
    if (breed.name == null) return;

    final response = await _breedApi.tryGetBreedImages(breed.name!);

    breed.images.value =
        (response.data['message'] as List).map((e) => e.toString()).toList();
  }
}
