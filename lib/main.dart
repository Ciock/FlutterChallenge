import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'design/tokens/texts.token.dart';
import 'pages/breed_detail/breed_detail.page.dart';
import 'pages/gallery/gallery.page.dart';
import 'pages/home/home.page.dart';
import 'pages/sub_breed_detail/sub_breed_detail.page.dart';
import 'store/breed/breed.service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

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
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: const Color(0xfff8f0e5),
          colorScheme: const ColorScheme.light().copyWith(
              surface: const Color(0xfff4e9d6),
              surfaceTint: const Color(0xfff4e3c8)),
        ),
        getPages: [homePage, breedDetailPage, subBreedDetailPage, galleryPage],
        initialRoute: homeRoute,
        builder: (context, child) => Scaffold(
          body: DefaultTextStyle.merge(
            style: CustomText.body.style,
            child: child ?? Container(),
          ),
        ),
      );
}
