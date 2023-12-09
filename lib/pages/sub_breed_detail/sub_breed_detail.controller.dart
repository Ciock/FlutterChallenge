import 'package:get/get.dart';

import '../../store/breed/breed.model.dart';
import '../../store/breed/breed.service.dart';
import '../breed_detail/breed_detail.controller.dart';
import 'sub_breed_detail.page.dart';

class SubBreedDetailPageController extends BreedDetailPageController {
  @override
  void Function() get imageUpdate => () {
        if (breed?.id != null && subBreed != null) {
          BreedService.to.updateSubBreedImage(subBreed!, breed!.id!);
          BreedService.to.updateSubBreedImages(subBreed!, breed!.id!);
        }
      };

  BreedModel? get subBreed => breed?.subBreeds.firstWhereOrNull(
        (element) =>
            element.id ==
            Get.parameters[SubBreedDetailParameters.subBreed.name],
      );

  String get pageTitle => '${subBreed?.name ?? ''} (${breed?.name})';
}
