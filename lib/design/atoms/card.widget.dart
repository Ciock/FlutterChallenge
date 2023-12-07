import 'package:flutter/material.dart';

import '../tokens/constants.token.dart';
import '../tokens/dimensions.token.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  const CustomCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) => Card(
        elevation: Constants.elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(CustomRadiusDimension.md.value),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(CustomRadiusDimension.md.value),
          child: child,
        ),
      );
}
