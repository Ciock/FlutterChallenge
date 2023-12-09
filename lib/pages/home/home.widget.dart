import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../design/atoms/card.widget.dart';
import '../../design/atoms/gradient.widget.dart';
import '../../design/components/dog_image.widget.dart';
import '../../design/components/search_bar.widget.dart';
import '../../design/tokens/dimensions.token.dart';
import '../../design/tokens/texts.token.dart';
import '../../store/breed/breed.model.dart';
import '../../store/breed/breed.service.dart';
import '../breed_detail/breed_detail.page.dart';
import 'home.controller.dart';

part 'home.style.dart';

class HomePageWidget extends GetView<HomePageController> {
  const HomePageWidget({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: CustomSpaceDimension.lg.value),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: CustomSpaceDimension.md.value),
                Text('Breeds', style: CustomText.h1.style),
                SizedBox(height: CustomSpaceDimension.lg.value),
                CustomSearchBar(controller: controller.searchController),
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
        ),
      );
}

class _BreedCard extends StatelessWidget {
  final BreedModel breed;

  const _BreedCard(this.breed);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => Get.toNamed(
          breedDetailRoute,
          parameters: {'breed': breed.id ?? ''},
        ),
        child: Hero(
          tag: breed.name,
          child: CustomCard(
            child: Obx(
              () {
                if (breed.image == null) {
                  BreedService.to.updateBreedImage(breed);
                }
                final imageWidth = MediaQuery.of(context).size.width;
                final imageHeight =
                    imageWidth / CustomRatioDimension.wide.value;

                return Stack(
                  children: [
                    if (breed.image != null)
                      DogImage(width: imageWidth, url: breed.image!),
                    GradientBox(height: imageHeight),
                    Positioned(
                      bottom: CustomSpaceDimension.lg.value,
                      left: CustomSpaceDimension.lg.value,
                      child: Text(
                        breed.name,
                        style:
                            CustomText.body.style.copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      );
}
