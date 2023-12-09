import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../store/breed/breed.model.dart';
import '../../store/breed/breed.service.dart';

class GalleryPageController extends GetxController {
  late PageController pageController;

  BreedModel? get breed => BreedService.to.breeds
      .firstWhereOrNull((element) => element.id == Get.parameters['breed']);

  BreedModel? get subBreed => breed?.subBreeds
      .firstWhereOrNull((element) => element.id == Get.parameters['subBreed']);

  List<String> get images => subBreed != null
      ? subBreed!.images
      : breed?.images ?? [Get.parameters['image'] ?? ''];

  @override
  void onInit() {
    super.onInit();

    final initalImage = Get.parameters['image'];
    if (initalImage != null) {
      pageController = PageController(initialPage: images.indexOf(initalImage));
    }
  }
}
