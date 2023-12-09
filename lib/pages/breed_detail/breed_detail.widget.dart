import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../design/atoms/card.widget.dart';
import '../../design/atoms/gradient.widget.dart';
import '../../design/components/dog_image.widget.dart';
import '../../design/tokens/dimensions.token.dart';
import '../../design/tokens/texts.token.dart';
import '../../store/breed/breed.model.dart';
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
                    child: _ImageHeader(breed: controller.breed),
                  ),
                  if (controller.breed?.subBreeds.isNotEmpty == true)
                    const _SubBreedsSection(),
                  if (controller.breed?.images.isNotEmpty == true) ...[
                    SizedBox(height: CustomSpaceDimension.xl.value),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: CustomSpaceDimension.lg.value,
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
                    child: _SmallHeader(breed: controller.breed),
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
              children: controller.breed!.subBreeds
                  .map((e) => Chip(label: Text(e)))
                  .toList(),
            ),
          ],
        ),
      );
}

class _SmallHeader extends StatelessWidget {
  const _SmallHeader({required this.breed});

  final BreedModel? breed;

  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Colors.grey)),
        ),
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top +
              CustomSpaceDimension.lg.value,
          bottom: CustomSpaceDimension.lg.value,
          right: CustomSpaceDimension.lg.value,
          left: CustomSpaceDimension.lg.value,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                breed?.name?.capitalize ?? '',
                style: CustomText.h1.style,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close),
              color: Colors.black,
              onPressed: Get.back,
            ),
          ],
        ),
      );
}

class _ImageHeader extends StatelessWidget {
  final BreedModel? breed;

  const _ImageHeader({required this.breed});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = width / CustomRatioDimension.tall.value;

    if (breed?.image.value == null) return Container();

    return Stack(
      children: [
        DogImage(
          width: width,
          url: breed!.image.value!,
          ratio: CustomRatioDimension.tall,
        ),
        GradientBox(height: height),
        Positioned(
          bottom: CustomSpaceDimension.lg.value,
          left: CustomSpaceDimension.lg.value,
          child: Text(
            breed!.name?.capitalize ?? '',
            style: CustomText.h1.style.copyWith(color: Colors.white),
          ),
        ),
        Positioned(
          right: CustomSpaceDimension.lg.value,
          top: CustomSpaceDimension.lg.value +
              MediaQuery.of(context).padding.top,
          child: IconButton(
            icon: const Icon(Icons.close),
            color: Colors.white,
            onPressed: Get.back,
          ),
        ),
      ],
    );
  }
}
