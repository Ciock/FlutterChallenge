import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../design/atoms/card.widget.dart';
import '../../design/components/dog_image.widget.dart';
import '../../design/components/image_header.widget.dart';
import '../../design/components/title_header.widget.dart';
import '../../design/tokens/dimensions.token.dart';
import '../../design/tokens/texts.token.dart';
import '../../store/breed/breed.model.dart';
import '../sub_breed_detail/sub_breed_detail.page.dart';
import 'breed_detail.controller.dart';

part 'breed_detail.style.dart';

class BreedDetailPageWidget extends GetView<BreedDetailPageController> {
  const BreedDetailPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final galleryImageWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Obx(
              () => ListView(
                controller: controller.scrollController,
                padding: EdgeInsets.zero,
                children: [
                  Hero(
                    tag: controller.breed?.name ?? '',
                    child: ImageHeader(
                      imageUrl: controller.breed?.image,
                      title: controller.breed?.name ?? '',
                    ),
                  ),
                  if (controller.breed?.subBreeds.isNotEmpty == true)
                    const _SubBreedsSection(),
                  if (controller.breed?.images.isNotEmpty == true) ...[
                    Padding(
                      padding: EdgeInsets.only(
                        left: CustomSpaceDimension.lg.value,
                        right: CustomSpaceDimension.lg.value,
                        top: CustomSpaceDimension.xl.value,
                      ),
                      child: Text('Gallery', style: CustomText.h2.style),
                    ),
                    ...controller.breed!.images.map(
                      (url) => Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: CustomSpaceDimension.lg.value,
                          vertical: CustomSpaceDimension.md.value,
                        ),
                        child: CustomCard(
                          child: DogImage(width: galleryImageWidth, url: url),
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
                    child: SmallHeader(title: controller.breed?.name ?? ''),
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

class _SubBreedsSection extends GetView<BreedDetailPageController> {
  const _SubBreedsSection();

  @override
  Widget build(BuildContext context) => Padding(
        padding:
            EdgeInsets.symmetric(horizontal: CustomSpaceDimension.lg.value),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: CustomSpaceDimension.xl.value),
            Text('Sub breeds', style: CustomText.h2.style),
            SizedBox(height: CustomSpaceDimension.md.value),
            Wrap(
              spacing: CustomSpaceDimension.md.value,
              children: controller.breed?.subBreeds
                      .map(
                        (subBreed) => GestureDetector(
                          onTap: () => Get.toNamed(
                            subBreedDetailRoute,
                            parameters: {
                              'breed_name': controller.breed?.name ?? '',
                              'sub_breed_name': subBreed.name,
                            },
                          ),
                          child: Chip(label: Text(subBreed.name)),
                        ),
                      )
                      .toList() ??
                  [],
            ),
          ],
        ),
      );
}
