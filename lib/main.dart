import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'design/tokens/colors.token.dart';
import 'design/tokens/texts.token.dart';
import 'pages/breed_detail/breed_detail.page.dart';
import 'pages/gallery/gallery.page.dart';
import 'pages/home/home.page.dart';
import 'pages/sub_breed_detail/sub_breed_detail.page.dart';
import 'store/breed/breed.service.dart';
import 'utils/translations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  Get.locale = Get.deviceLocale;

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
        debugShowCheckedModeBanner: false,
        translations: AppTranslations(),
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: CustomColors.background,
          colorScheme: const ColorScheme.light().copyWith(
            surface: CustomColors.surface,
            surfaceTint: CustomColors.surfaceTint,
          ),
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
