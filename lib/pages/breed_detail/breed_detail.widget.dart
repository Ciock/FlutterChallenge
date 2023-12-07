import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../design/atoms/gradient.widget.dart';
import '../../design/components/error_image.widget.dart';
import '../../design/tokens/dimensions.token.dart';
import '../../design/tokens/texts.token.dart';
import '../../store/breed/breed.model.dart';
import 'breed_detail.controller.dart';

part 'breed_detail.style.dart';

class BreedDetailPageWidget extends GetView<BreedDetailPageController> {
  const BreedDetailPageWidget({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        top: false,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _ImageHeader(breed: controller.breed),
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
        Image(
          width: width,
          height: height,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => ErrorImage(height: height),
          image: ResizeImage(
            NetworkImage(breed!.image.value!),
            width: width.toInt(),
          ),
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
      ],
    );
  }
}
