import 'package:get/get.dart';

import 'sub_breed_detail.controller.dart';
import 'sub_breed_detail.widget.dart';

final subBreedDetailPage = GetPage(
  binding: SubBreedDetailPageBinding(),
  name: '/$subBreedDetailRoute',
  page: SubBreedDetailPageWidget.new,
);

const subBreedDetailRoute = 'subBreedDetail';

class SubBreedDetailPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubBreedDetailPageController>(SubBreedDetailPageController.new);
  }
}
