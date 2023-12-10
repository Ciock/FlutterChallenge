part of 'breed.model.dart';

extension BreedSelectors on BreedModel {
  String get name => id?.capitalize ?? '';

  set image(String? value) => _image.value = value;
  String? get image => _image.value;

  set images(List<String> value) => _images.value = value;
  List<String> get images => _images;
  Stream<List<String>> get images$ => _images.stream;
}
