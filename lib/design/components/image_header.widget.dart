import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../pages/breed_detail/breed_detail.page.dart';
import '../../pages/gallery/gallery.page.dart';
import '../../pages/sub_breed_detail/sub_breed_detail.page.dart';
import '../../store/breed/breed.model.dart';
import '../atoms/gradient.widget.dart';
import '../tokens/dimensions.token.dart';
import '../tokens/texts.token.dart';
import 'dog_image.widget.dart';

class ImageHeader extends StatelessWidget {
  final String? imageUrl;
  final String title;
  final BreedModel? breed;
  final BreedModel? subBreed;

  const ImageHeader({
    super.key,
    required this.imageUrl,
    required this.title,
    this.breed,
    this.subBreed,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = width / CustomRatioDimension.tall.value;

    return Stack(
      children: [
        if (imageUrl != null)
          GestureDetector(
            onTap: () => Get.toNamed(
              galleryRoute,
              parameters: {
                GalleryParameters.image.name: imageUrl ?? '',
                BreedDetailParameters.breed.name: breed?.id ?? '',
                SubBreedDetailParameters.subBreed.name: breed?.id ?? '',
              },
            ),
            child: DogImage(
              width: width,
              url: imageUrl!,
              ratio: CustomRatioDimension.tall,
            ),
          ),
        GradientBox(height: height),
        Positioned(
          bottom: CustomSpaceDimension.lg.value,
          left: CustomSpaceDimension.lg.value,
          right: CustomSpaceDimension.lg.value,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: CustomText.h1.style.copyWith(color: Colors.white),
            ),
          ),
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
    );
  }
}
