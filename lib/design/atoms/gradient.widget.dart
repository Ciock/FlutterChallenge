import 'package:flutter/material.dart';

class GradientBox extends StatelessWidget {
  final double height;

  const GradientBox({super.key, required this.height});

  @override
  Widget build(BuildContext context) => IgnorePointer(
        child: Container(
          height: height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.black, Colors.transparent],
              stops: [0, 0.2],
            ),
          ),
        ),
      );
}
