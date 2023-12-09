import 'package:get/get.dart';

class BreedModel {
  String? name;
  List<BreedModel> subBreeds;
  final image = RxnString();
  final images = RxList<String>();

  BreedModel({this.subBreeds = const [], this.name});

  factory BreedModel.fromGetBreedsResponse(MapEntry<dynamic, dynamic> data) =>
      BreedModel()..updateFromGetBreedsResponse(data);
}

extension _UpdateFromApiResponse on BreedModel {
  void updateFromGetBreedsResponse(MapEntry<dynamic, dynamic> data) {
    name = data.key;
    subBreeds = (data.value as List)
        .map((e) => BreedModel(name: e.toString()))
        .toList();
  }
}
