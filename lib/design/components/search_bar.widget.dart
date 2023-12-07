import 'package:flutter/material.dart';

import '../../pages/home/home.controller.dart';
import '../tokens/constants.token.dart';
import '../tokens/texts.token.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    required this.controller,
  });

  final HomePageController controller;

  @override
  Widget build(BuildContext context) => SearchBar(
        controller: controller.searchController,
        textStyle: MaterialStateProperty.all(CustomText.body.style),
        hintText: 'Search...',
        leading: const Icon(Icons.search),
        elevation: const MaterialStatePropertyAll(Constants.elevation),
      );
}
