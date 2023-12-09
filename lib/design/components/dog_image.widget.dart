import 'dart:ui';

import 'package:flutter/material.dart';

import '../tokens/dimensions.token.dart';
import 'error_image.widget.dart';

class DogImage extends StatelessWidget {
  final String url;
  final double width;
  final CustomRatioDimension ratio;

  const DogImage({
    super.key,
    required this.url,
    required this.width,
    this.ratio = CustomRatioDimension.wide,
  });

  @override
  Widget build(BuildContext context) {
    final height = width / ratio.value;

    return Image(
      width: width,
      height: height,
      fit: BoxFit.cover,
      errorBuilder: (_, __, ___) => ErrorImage(height: height),
      loadingBuilder: (_, child, loadingProgress) => loadingProgress == null
          ? child
          : SizedBox(
              height: height,
              child: Center(
                child: CircularProgressIndicator(
                  value: imageLoadingProgressValue(
                    loadingProgress.cumulativeBytesLoaded,
                    loadingProgress.expectedTotalBytes,
                  ),
                ),
              ),
            ),
      image: ResizeImage(
        NetworkImage(url),
        width: width.toInt(),
      ),
    );
  }

  double? imageLoadingProgressValue(int downloaded, int? total) =>
      total != null ? clampDouble(downloaded / total, 0.1, 1) : null;
}
