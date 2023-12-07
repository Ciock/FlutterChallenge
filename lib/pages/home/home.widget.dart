import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../design/atoms/card.widget.dart';
import '../../design/components/error_image.widget.dart';
import '../../design/components/search_bar.widget.dart';
import '../../design/tokens/dimensions.token.dart';
import '../../design/tokens/texts.token.dart';
import '../../store/breed/breed.model.dart';
import '../../store/breed/breed.service.dart';
import 'home.controller.dart';

part 'home.style.dart';

class HomePageWidget extends GetView<HomePageController> {
  const HomePageWidget({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: CustomSpaceDimension.lg.value),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: CustomSpaceDimension.md.value),
              Text('Breeds', style: CustomText.h1.style),
              SizedBox(height: CustomSpaceDimension.lg.value),
              CustomSearchBar(controller: controller),
              Padding(
                padding: EdgeInsets.only(top: CustomSpaceDimension.lg.value),
                child: const Divider(height: 0),
              ),
              Expanded(
                child: Obx(
                  () => ListView.separated(
                    padding: EdgeInsets.symmetric(
                      vertical: CustomSpaceDimension.lg.value,
                    ),
                    itemCount: controller.filteredBreeds.length,
                    itemBuilder: (context, index) =>
                        _BreedCard(controller.filteredBreeds[index]),
                    separatorBuilder: (context, index) =>
                        SizedBox(height: CustomSpaceDimension.lg.value),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}

class _BreedCard extends StatelessWidget {
  final BreedModel breed;

  const _BreedCard(this.breed);

  @override
  Widget build(BuildContext context) => CustomCard(
        child: Obx(
          () {
            if (breed.image.value == null) {
              BreedService.to.updateBreedImage(breed);
            }
            final imageWidth = MediaQuery.of(context).size.width;
            final imageHeight = imageWidth / CustomRatioDimension.wide.value;

            return Stack(
              children: [
                if (breed.image.value != null)
                  Image(
                    width: imageWidth,
                    height: imageHeight,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) =>
                        ErrorImage(height: imageHeight),
                    image: ResizeImage(
                      NetworkImage(breed.image.value!),
                      width: imageWidth.toInt(),
                    ),
                  ),
                const _Gradient(),
                Positioned(
                  bottom: CustomSpaceDimension.lg.value,
                  left: CustomSpaceDimension.lg.value,
                  child: Text(
                    breed.name?.capitalize ?? '',
                    style: CustomText.body.style.copyWith(color: Colors.white),
                  ),
                ),
              ],
            );
          },
        ),
      );
}

class _Gradient extends StatelessWidget {
  const _Gradient();

  @override
  Widget build(BuildContext context) => Container(
        height: Get.width / CustomRatioDimension.wide.value,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.black, Colors.transparent],
            stops: [0, 0.2],
          ),
        ),
      );
}
