import 'package:get/get.dart';

import 'breed.api.dart';
import 'breed.model.dart';

part 'breed.actions.dart';

class BreedService extends GetxService {
  static BreedService get to => Get.find<BreedService>();

  final BreedApi _breedApi;

  BreedService({BreedApi? breedApi}) : _breedApi = breedApi ?? BreedApi();

  List<BreedModel> get breeds => _breeds;
  final _breeds = <BreedModel>[].obs;

  @override
  void onReady() {
    super.onReady();

    getBreeds();
  }
}
