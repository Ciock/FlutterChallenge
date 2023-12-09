import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../design/components/error_image.widget.dart';
import 'gallery.controller.dart';

part 'gallery.style.dart';

class GalleryPageWidget extends GetView<GalleryPageController> {
  const GalleryPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView(
        controller: controller.pageController,
        children: controller.images
            .map(
              (image) => Hero(
                tag: image,
                child: Image(
                  width: width,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => const ErrorImage(),
                  image: ResizeImage(
                    NetworkImage(image),
                    width: width.toInt(),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
