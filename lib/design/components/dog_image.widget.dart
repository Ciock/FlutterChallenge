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
      image: ResizeImage(
        NetworkImage(url),
        width: width.toInt(),
      ),
    );
  }
}
