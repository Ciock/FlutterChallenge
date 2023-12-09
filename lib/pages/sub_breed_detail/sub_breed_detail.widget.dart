import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../design/atoms/card.widget.dart';
import '../../design/components/dog_image.widget.dart';
import '../../design/components/image_header.widget.dart';
import '../../design/components/title_header.widget.dart';
import '../../design/tokens/dimensions.token.dart';
import '../../design/tokens/texts.token.dart';
import '../../store/breed/breed.model.dart';
import '../gallery/gallery.page.dart';
import 'sub_breed_detail.controller.dart';

part 'sub_breed_detail.style.dart';

class SubBreedDetailPageWidget extends GetView<SubBreedDetailPageController> {
  const SubBreedDetailPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final galleryImageWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        top: false,
        left: false,
        right: false,
        child: Stack(
          children: [
            Obx(
              () => ListView(
                controller: controller.scrollController,
                padding: EdgeInsets.zero,
                children: [
                  ImageHeader(
                    imageUrl: controller.subBreed?.image,
                    title: controller.pageTitle,
                  ),
                  if (controller.subBreed?.images.isNotEmpty == true) ...[
                    Padding(
                      padding: EdgeInsets.only(
                        left: CustomSpaceDimension.lg.value +
                            MediaQuery.of(context).padding.left,
                        right: CustomSpaceDimension.lg.value +
                            MediaQuery.of(context).padding.right,
                        top: CustomSpaceDimension.xl.value,
                      ),
                      child: Text('Gallery', style: CustomText.h2.style),
                    ),
                    ...controller.subBreed!.images.map(
                      (url) => Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: CustomSpaceDimension.lg.value +
                              MediaQuery.of(context).padding.right,
                          vertical: CustomSpaceDimension.md.value,
                        ),
                        child: GestureDetector(
                          onTap: () => Get.toNamed(
                            galleryRoute,
                            parameters: {
                              'image': url,
                              'breed': controller.breed?.id ?? '',
                              'sub_breed': controller.subBreed?.id ?? '',
                            },
                          ),
                          child: Hero(
                            tag: url,
                            child: CustomCard(
                              child:
                                  DogImage(width: galleryImageWidth, url: url),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Obx(
                () => IgnorePointer(
                  ignoring: controller.smallHeaderOpacity.value == 0,
                  child: Opacity(
                    opacity: controller.smallHeaderOpacity.value,
                    child: SmallHeader(title: controller.pageTitle),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
