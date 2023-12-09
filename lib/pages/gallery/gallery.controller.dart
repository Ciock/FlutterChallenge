import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    final initalImage = Get.parameters['image'];
    if (initalImage != null) {
      pageController = PageController(initialPage: images.indexOf(initalImage));
    }
  }

  @override
  void onClose() {
    super.onClose();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
