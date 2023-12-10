import 'package:deliveristo_interview/design/components/dog_image.widget.dart';
import 'package:deliveristo_interview/design/components/image_header.widget.dart';
import 'package:deliveristo_interview/design/components/title_header.widget.dart';
import 'package:deliveristo_interview/main.dart';
import 'package:deliveristo_interview/pages/breed_detail/breed_detail.page.dart';
import 'package:deliveristo_interview/pages/breed_detail/breed_detail.widget.dart';
import 'package:deliveristo_interview/pages/gallery/gallery.page.dart';
import 'package:deliveristo_interview/store/breed/breed.model.dart';
import 'package:deliveristo_interview/store/breed/breed.service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test BreedDetail Page', () {
    setUpAll(initServices);

    testWidgets('Breed Detail Page, navigation to gallery', (tester) async {
      await tester.pumpWidget(const MainApp());

      final breeds = await BreedService.to.breeds$.first;

      final breedWithSubBreeds =
          breeds.firstWhere((element) => element.subBreeds.isNotEmpty);

      await BreedService.to.updateBreedImage(breedWithSubBreeds);

      Get.toNamed(
        breedDetailRoute,
        parameters: {
          BreedDetailParameters.breed.name: breedWithSubBreeds.id ?? '',
        },
      );
      await tester.pumpAndSettle();

      // Finds headers
      expect(find.byType(ImageHeader), findsOneWidget);
      expect(find.byType(SmallHeader), findsOneWidget);

      // Finds header and small header titles matching breed name
      expect(find.text(breedWithSubBreeds.name), findsNWidgets(2));

      // Finds SubBreedsSection after scroll
      await tester.scrollUntilVisible(find.byType(SubBreedsSection), 200);
      expect(find.byType(SubBreedsSection), findsOneWidget);

      // Finds Gallery section
      await tester.scrollUntilVisible(find.text('Gallery'), 20);
      expect(find.text('Gallery'), findsOneWidget);

      // Finds Gallery section
      final dogImage = find.byType(DogImage);
      await tester.scrollUntilVisible(dogImage, 200);
      await tester.tap(dogImage.first);
      await tester.pumpAndSettle();

      // Verify the new current page is gallery page.
      expect(Get.currentRoute, matches(galleryRoute));
    });
  });
}
