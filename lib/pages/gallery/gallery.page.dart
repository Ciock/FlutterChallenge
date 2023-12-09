import 'package:get/get.dart';

import 'gallery.controller.dart';
import 'gallery.widget.dart';

final galleryPage = GetPage(
  binding: GalleryPageBinding(),
  name: '/$galleryRoute',
  page: GalleryPageWidget.new,
);

const galleryRoute = 'gallery';

enum GalleryParameters { image }

class GalleryPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GalleryPageController>(GalleryPageController.new);
  }
}
