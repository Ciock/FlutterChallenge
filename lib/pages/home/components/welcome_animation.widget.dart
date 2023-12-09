import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../store/breed/breed.service.dart';

class WelcomeAnimation extends StatefulWidget {
  const WelcomeAnimation({super.key});

  @override
  State<WelcomeAnimation> createState() => _WelcomeAnimationState();
}

class _WelcomeAnimationState extends State<WelcomeAnimation> {
  double opacity = 1;

  @override
  void initState() {
    super.initState();
    setAnimationRemove();
  }

  Future setAnimationRemove() async {
    // show animation until breed list is retrieved.
    // show animation for at least 2 seconds
    await Future.wait([
      BreedService.to.breeds$.first,
      Future.delayed(const Duration(seconds: 2)),
    ]);

    setState(() {
      opacity = 0;
    });
  }

  @override
  Widget build(BuildContext context) => IgnorePointer(
        ignoring: opacity < 1,
        child: AnimatedOpacity(
          opacity: opacity,
          duration: const Duration(milliseconds: 1500),
          curve: Curves.decelerate,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Lottie.asset('assets/HomeAnimation.json'),
          ),
        ),
      );
}
