import 'package:get/get.dart';

import '../../store/breed/breed.model.dart';
import '../../store/breed/breed.service.dart';

class HomePageController extends GetxController {
  List<BreedModel> get breeds => BreedService.to.breeds;
}
