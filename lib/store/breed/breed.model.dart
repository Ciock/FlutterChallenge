import 'package:get/get.dart';

part 'breed.selectors.dart';

class BreedModel {
  String? id;
  List<BreedModel> subBreeds;
  final _image = RxnString();
  final _images = RxList<String>();

  BreedModel({this.subBreeds = const [], this.id});

  factory BreedModel.fromGetBreedsResponse(MapEntry<dynamic, dynamic> data) =>
      BreedModel()..updateFromGetBreedsResponse(data);

  Map<String, dynamic> toJson() => {
        'id': id,
        'subBreeds': subBreeds.map((e) => e.toJson()).toList(),
        'image': image.toString(),
        'images': images,
      };
}

extension _UpdateFromApiResponse on BreedModel {
  void updateFromGetBreedsResponse(MapEntry<dynamic, dynamic> data) {
    id = data.key;
    subBreeds =
        (data.value as List).map((e) => BreedModel(id: e.toString())).toList();
  }
}
