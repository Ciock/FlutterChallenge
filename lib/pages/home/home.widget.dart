import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../design/tokens/dimensions.token.dart';
import '../../store/breed/breed.model.dart';
import '../../store/breed/breed.service.dart';
import 'home.controller.dart';

part 'home.style.dart';

class HomePageWidget extends GetView<HomePageController> {
  const HomePageWidget({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const Text('Breeds'),
              const SearchBar(),
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    itemCount: controller.breeds.length,
                    itemBuilder: (context, index) =>
                        _BreedCard(controller.breeds[index]),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}

class _BreedCard extends StatelessWidget {
  final BreedModel breed;

  const _BreedCard(this.breed);

  @override
  Widget build(BuildContext context) => Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(CustomRadiusDimension.md.value),
        ),
        child: Obx(
          () {
            if (breed.image.value == null) {
              BreedService.to.updateBreedImage(breed);
            }
            return Stack(
              children: [
                if (breed.image.value != null)
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(CustomRadiusDimension.md.value),
                    child: Image.network(breed.image.value!),
                  ),
                Text(
                  breed.name ?? '',
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            );
          },
        ),
      );
}
