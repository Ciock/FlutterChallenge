import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../design/tokens/dimensions.token.dart';
import '../../store/breed/breed.model.dart';
import '../../store/breed/breed.service.dart';
import 'breed_detail.page.dart';

class BreedDetailPageController extends GetxController {
  void Function() get imageUpdate => () {
        if (breed != null) BreedService.to.updateBreedImages(breed!);
      };

  final scrollController = ScrollController();
  final smallHeaderOpacity = .0.obs;

  BreedModel? get breed => BreedService.to.breeds.firstWhereOrNull(
        (element) =>
            element.id == Get.parameters[BreedDetailParameters.breed.name],
      );

  @override
  void onInit() {
    super.onInit();

    scrollController.addListener(() {
      final height = Get.width / CustomRatioDimension.tall.value -
          Get.mediaQuery.padding.top -
          90;
      smallHeaderOpacity.value =
          clampDouble((scrollController.offset - height) / 90, 0, 1);
    });
  }

  @override
  void onReady() {
    super.onReady();

    imageUpdate();
  }
}
