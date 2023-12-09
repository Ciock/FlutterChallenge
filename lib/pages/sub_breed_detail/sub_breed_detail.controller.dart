import 'package:get/get.dart';

import '../../store/breed/breed.model.dart';
import '../breed_detail/breed_detail.controller.dart';

class SubBreedDetailPageController extends BreedDetailPageController {
  BreedModel? get subBreed => breed?.subBreeds.firstWhereOrNull(
        (element) => element.name == Get.parameters['sub_breed_name'],
      );
}
