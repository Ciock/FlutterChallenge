import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../store/breed/breed.model.dart';
import '../../store/breed/breed.service.dart';

class HomePageController extends GetxController {
  final searchController = TextEditingController();
  final searchText = RxString('');

  List<BreedModel> get filteredBreeds => breeds
      .where((element) => element.name.contains(searchText.value))
      .toList();
  List<BreedModel> get breeds => BreedService.to.breeds;

  @override
  void onInit() {
    super.onInit();

    searchController.addListener(
      () {
        searchText.value = searchController.text;
      },
    );
  }
}
