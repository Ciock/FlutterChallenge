import 'package:deliveristo_interview/design/components/search_bar.widget.dart';
import 'package:deliveristo_interview/main.dart';
import 'package:deliveristo_interview/pages/breed_detail/breed_detail.page.dart';
import 'package:deliveristo_interview/pages/home/components/breed_card.widget.dart';
import 'package:deliveristo_interview/pages/home/components/welcome_animation.widget.dart';
import 'package:deliveristo_interview/store/breed/breed.service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('Load breeds and open first detail page', (tester) async {
      initServices();
      // Load app widget.
      await tester.pumpWidget(const MainApp());

      // Verify the Title
      expect(find.text('Breeds'), findsOneWidget);

      expect(find.text('No breed found'), findsOneWidget);

      expect(find.byType(CustomSearchBar), findsOneWidget);

      await Future.wait([
        BreedService.to.breeds$.first,
        Future.delayed(WelcomeAnimation.animationMinDuration),
      ]);

      await tester.pump();

      // Finds the BreedCard to tap on.
      final breedCard = find.byType(BreedCard);

      await tester.tap(breedCard.first);

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Verify the new current page is detail page.
      expect(Get.currentRoute, matches(breedDetailRoute));
    });
  });
}
