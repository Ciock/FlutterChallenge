import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../store/breed/breed.model.dart';
import '../../store/breed/breed.service.dart';
import '../breed_detail/breed_detail.page.dart';
import '../sub_breed_detail/sub_breed_detail.page.dart';
import 'gallery.page.dart';

class GalleryPageController extends GetxController {
  late PageController pageController;

  BreedModel? get breed => BreedService.to.breeds.firstWhereOrNull(
        (element) =>
            element.id == Get.parameters[BreedDetailParameters.breed.name],
      );

  BreedModel? get subBreed => breed?.subBreeds.firstWhereOrNull(
        (element) =>
            element.id ==
            Get.parameters[SubBreedDetailParameters.subBreed.name],
      );

  List<String> get images => subBreed != null
      ? subBreed!.images
      : breed?.images ?? [Get.parameters[GalleryParameters.image.name] ?? ''];

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
