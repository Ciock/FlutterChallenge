import 'package:get/get.dart';

import 'home.controller.dart';
import 'home.widget.dart';

final homePage = GetPage(
  binding: HomePageBinding(),
  name: '/$homeRoute',
  page: HomePageWidget.new,
);

const homeRoute = 'home';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(HomePageController.new);
  }
}
