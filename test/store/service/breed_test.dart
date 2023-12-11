import 'dart:convert';

import 'package:deliveristo_interview/store/breed/breed.api.dart';
import 'package:deliveristo_interview/store/breed/breed.model.dart';
import 'package:deliveristo_interview/store/breed/breed.service.dart';
import 'package:dio/dio.dart' as d;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../api.utils.dart';
import 'breed_test.mocks.dart';

@GenerateMocks([BreedApi])
void main() {
  final breeds = (testBreedListApi['message'] as Map)
      .entries
      .map(BreedModel.fromGetBreedsResponse)
      .toList();

  late final MockBreedApi mockBreedApi;
  late final BreedService service;

  setUpAll(() {
    mockBreedApi = MockBreedApi();

    when(mockBreedApi.tryGetBreeds()).thenAnswer(
      (realInvocation) async => d.Response(
        data: testBreedListApi,
        requestOptions: d.RequestOptions(),
      ),
    );

    when(mockBreedApi.tryGetBreedImage(any)).thenAnswer(
      (realInvocation) async => d.Response(
        data: testBreedImageApi,
        requestOptions: d.RequestOptions(),
      ),
    );

    when(mockBreedApi.tryGetBreedImages(any)).thenAnswer(
      (realInvocation) async => d.Response(
        data: testBreedImagesApi,
        requestOptions: d.RequestOptions(),
      ),
    );

    service = BreedService(breedApi: mockBreedApi);
  });

  group('BreedService test', () {
    test('Init breeds', () async {
      service.onReady();

      await service.breeds$.first;

      expect(
        service.breeds.map((e) => jsonEncode(e.toJson())),
        breeds.map((e) => jsonEncode(e.toJson())),
      );
    });

    test('Get breed image', () async {
      final breed = BreedModel();

      await service.updateBreedImage(breed);

      expect(breed.image, isNull);

      breed.id = 'id';

      await service.updateBreedImage(breed);

      expect(breed.image, testBreedImages.first);
    });

    test('Get breed images', () async {
      final breed = BreedModel();

      await service.updateBreedImages(breed);

      expect(breed.images, isEmpty);

      breed.id = 'id';

      await service.updateBreedImages(breed);

      expect(breed.images, testBreedImages);
    });
  });
}
