import 'package:get/get.dart';

import 'breed_detail.controller.dart';
import 'breed_detail.widget.dart';

final breedDetailPage = GetPage(
  binding: BreedDetailPageBinding(),
  name: '/$breedDetailRoute',
  page: BreedDetailPageWidget.new,
);

const breedDetailRoute = 'breedDetail';

class BreedDetailPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BreedDetailPageController>(BreedDetailPageController.new);
  }
}
