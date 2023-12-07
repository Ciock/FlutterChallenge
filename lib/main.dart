import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'design/tokens/texts.token.dart';
import 'pages/breed_detail/breed_detail.page.dart';
import 'pages/home/home.page.dart';
import 'store/breed/breed.service.dart';

void main() {
  initServices();
  runApp(const MainApp());
}

void initServices() {
  Get.put(BreedService());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        getPages: [homePage, breedDetailPage],
        initialRoute: homeRoute,
        builder: (context, child) => Scaffold(
          body: DefaultTextStyle.merge(
            style: CustomText.body.style,
            child: child ?? Container(),
          ),
        ),
      );
}
