import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../design/components/error_image.widget.dart';
import '../../design/tokens/dimensions.token.dart';
import 'gallery.controller.dart';

part 'gallery.style.dart';

class GalleryPageWidget extends GetView<GalleryPageController> {
  const GalleryPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            children: controller.images
                .map(
                  (image) => Hero(
                    tag: image,
                    child: Image(
                      width: width,
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) => const ErrorImage(),
                      loadingBuilder: (context, child, loadingProgress) =>
                          loadingProgress == null
                              ? child
                              : Center(
                                  child: CircularProgressIndicator(
                                    value: imageLoadingProgressValue(
                                      loadingProgress.cumulativeBytesLoaded,
                                      loadingProgress.expectedTotalBytes,
                                    ),
                                  ),
                                ),
                      image: ResizeImage(
                        NetworkImage(image),
                        width: width.toInt(),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          Positioned(
            right: CustomSpaceDimension.lg.value +
                MediaQuery.of(context).padding.right,
            top: CustomSpaceDimension.lg.value +
                MediaQuery.of(context).padding.top,
            child: IconButton(
              icon: const Icon(Icons.close),
              color: Colors.white,
              onPressed: Get.back,
            ),
          ),
        ],
      ),
    );
  }

  double? imageLoadingProgressValue(int downloaded, int? total) =>
      total != null ? clampDouble(downloaded / total, 0.1, 1) : null;
}
