import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../design/components/search_bar.widget.dart';
import '../../design/tokens/dimensions.token.dart';
import '../../design/tokens/texts.token.dart';
import 'components/breed_card.widget.dart';
import 'components/welcome_animation.widget.dart';
import 'home.controller.dart';

part 'home.style.dart';

class HomePageWidget extends GetView<HomePageController> {
  const HomePageWidget({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          children: [
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: CustomSpaceDimension.lg.value,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: CustomSpaceDimension.md.value),
                    Text('Breeds', style: CustomText.h1.style),
                    SizedBox(height: CustomSpaceDimension.lg.value),
                    CustomSearchBar(controller: controller.searchController),
                    Padding(
                      padding:
                          EdgeInsets.only(top: CustomSpaceDimension.lg.value),
                      child: const Divider(height: 0),
                    ),
                    Obx(
                      () {
                        if (controller.filteredBreeds.isEmpty) {
                          return Center(
                            child: Padding(
                              padding:
                                  EdgeInsets.all(CustomSpaceDimension.xl.value),
                              child: const Text('No breed found'),
                            ),
                          );
                        }

                        return Expanded(
                          child: ListView.separated(
                            padding: EdgeInsets.symmetric(
                              vertical: CustomSpaceDimension.lg.value,
                            ),
                            itemCount: controller.filteredBreeds.length,
                            itemBuilder: (context, index) =>
                                BreedCard(controller.filteredBreeds[index]),
                            separatorBuilder: (context, index) =>
                                SizedBox(height: CustomSpaceDimension.lg.value),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const Center(child: WelcomeAnimation()),
          ],
        ),
      );
}
