import 'package:get/get.dart';

import '../../store/breed/breed.model.dart';
import '../../store/breed/breed.service.dart';
import '../breed_detail/breed_detail.controller.dart';

class SubBreedDetailPageController extends BreedDetailPageController {
  @override
  void Function() get imageUpdate => () {
        if (breed?.id != null && subBreed != null) {
          BreedService.to.updateSubBreedImages(subBreed!, breed!.id!);
        }
      };

  BreedModel? get subBreed => breed?.subBreeds.firstWhereOrNull(
        (element) => element.name == Get.parameters['sub_breed_name'],
      );
}
