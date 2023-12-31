import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../tokens/dimensions.token.dart';

class ErrorImage extends StatelessWidget {
  final double? height;

  const ErrorImage({super.key, this.height});

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Image.asset(
            'assets/404.png',
            fit: BoxFit.cover,
            height: height,
          ),
          Positioned(
            top: CustomSpaceDimension.md.value,
            left: 0,
            right: 0,
            child: Text(
              'Image not found'.tr,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
}
