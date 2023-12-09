import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../design/tokens/dimensions.token.dart';
import 'breed.api.dart';
import 'breed.model.dart';

part 'breed.actions.dart';

class BreedService extends GetxService {
  static BreedService get to => Get.find<BreedService>();

  final BreedApi _breedApi;

  Stream<List<BreedModel>> get breeds$ => _breeds.stream;
  List<BreedModel> get breeds => _breeds;
  final _breeds = <BreedModel>[].obs;

  double secondToRetryInit = 3;

  BreedService({BreedApi? breedApi}) : _breedApi = breedApi ?? BreedApi();

  @override
  void onReady() {
    super.onReady();

    _initBreeds();
  }

  Future<void> _initBreeds() async {
    try {
      await getBreeds();
    } on DioException catch (_) {
      Get.snackbar(
        'Connection error'.tr,
        'Check your connection, we\'ll try again in @seconds seconds'
            .trParams({'seconds': secondToRetryInit.toInt().toString()}),
        duration: Duration(seconds: secondToRetryInit.toInt()),
        margin: EdgeInsets.all(CustomSpaceDimension.lg.value),
      );

      Future.delayed(Duration(seconds: secondToRetryInit.toInt()))
          .then((value) => _initBreeds());
      secondToRetryInit *= 1.5;
    }
  }
}
