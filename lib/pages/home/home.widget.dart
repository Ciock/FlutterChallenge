import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../design/tokens/dimensions.token.dart';
import '../../design/tokens/texts.token.dart';
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(CustomSpaceDimension.lg.value),
                child: Text('Breeds', style: CustomText.h1.style),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: CustomSpaceDimension.lg.value,
                ),
                child: const SearchBar(),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: CustomSpaceDimension.lg.value,
                  right: CustomSpaceDimension.lg.value,
                  top: CustomSpaceDimension.lg.value,
                ),
                child: const Divider(height: 0),
              ),
              Expanded(
                child: Obx(
                  () => ListView.separated(
                    padding: EdgeInsets.all(CustomSpaceDimension.lg.value),
                    itemCount: controller.breeds.length,
                    addAutomaticKeepAlives: true,
                    itemBuilder: (context, index) =>
                        _BreedCard(controller.breeds[index]),
                    separatorBuilder: (context, index) =>
                        SizedBox(height: CustomSpaceDimension.lg.value),
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
            return ClipRRect(
                borderRadius:
                    BorderRadius.circular(CustomRadiusDimension.md.value),
                child: Stack(
                  children: [
                    if (breed.image.value != null)
                      Image(
                        image: ResizeImage(
                          NetworkImage(breed.image.value!),
                          width: Get.width.toInt(),
                        ),
                        width: Get.width,
                        height: Get.width / CustomRatioDimension.wide.value,
                        fit: BoxFit.cover,
                      ),
                    Container(
                      height: Get.width / CustomRatioDimension.wide.value,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [Colors.black, Colors.transparent],
                          stops: [0, 0.2],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: CustomSpaceDimension.lg.value,
                      left: CustomSpaceDimension.lg.value,
                      child: Text(
                        breed.name?.capitalize ?? '',
                        style:
                            CustomText.body.style.copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ));
          },
        ),
      );
}
