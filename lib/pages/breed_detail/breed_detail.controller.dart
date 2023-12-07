import 'package:get/get.dart';

import '../../store/breed/breed.model.dart';
import '../../store/breed/breed.service.dart';

class BreedDetailPageController extends GetxController {
  BreedModel? get breed => BreedService.to.breeds.firstWhereOrNull(
        (element) => element.name == Get.parameters['breed_name'],
      );
}
