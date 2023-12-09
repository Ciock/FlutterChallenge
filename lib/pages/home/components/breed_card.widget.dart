import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../design/atoms/card.widget.dart';
import '../../../design/atoms/gradient.widget.dart';
import '../../../design/components/dog_image.widget.dart';
import '../../../design/tokens/dimensions.token.dart';
import '../../../design/tokens/texts.token.dart';
import '../../../store/breed/breed.model.dart';
import '../../../store/breed/breed.service.dart';
import '../../breed_detail/breed_detail.page.dart';

class BreedCard extends StatelessWidget {
  final BreedModel breed;

  const BreedCard(this.breed, {super.key});

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => Get.toNamed(
          breedDetailRoute,
          parameters: {BreedDetailParameters.breed.name: breed.id ?? ''},
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
