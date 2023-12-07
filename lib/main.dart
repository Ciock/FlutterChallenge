import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/home/home.page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        getPages: [homePage],
        initialRoute: homeRoute,
      );
}
