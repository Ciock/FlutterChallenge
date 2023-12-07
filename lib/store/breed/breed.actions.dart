part of 'breed.service.dart';

extension BreedActions on BreedService {
  Future<void> getBreeds() async {
    final response = await _breedApi.tryGetBreeds();

    _breeds.value = (response.data['message'] as Map)
        .entries
        .map(BreedModel.fromGetBreedsResponse)
        .toList();
  }
}
