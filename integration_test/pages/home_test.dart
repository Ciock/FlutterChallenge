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

  group('end-to-end test Home Page', () {
    setUpAll(initServices);

    testWidgets('Load breeds, Interact with SearchBar, Open Breed Detail Page',
        (tester) async {
      await tester.pumpWidget(const MainApp());

      expect(find.byType(WelcomeAnimation), findsOneWidget);
      // Await for WelcomeAnimation to end
      await Future.wait([
        BreedService.to.breeds$.first,
        Future.delayed(WelcomeAnimation.animationMinDuration),
      ]);

      await tester.pump();

      // Verify the Title
      expect(find.text('Breeds'), findsOneWidget);

      // Test search bar interaction.
      final searchBar = find.byType(CustomSearchBar);
      expect(searchBar, findsOneWidget);

      // enter random text to avoid matching any breed
      await tester.enterText(searchBar, 'woenpwenckwxowbe');
      await tester.pump();

      // should show no BreedCard
      expect(find.text('No breed found'), findsOneWidget);
      expect(find.byType(BreedCard), findsNothing);

      // clear search bar
      await tester.enterText(searchBar, '');
      await tester.pump();

      expect(find.text('No breed found'), findsNothing);
      // Finds the BreedCard to tap on.
      final breedCard = find.byType(BreedCard);

      await tester.tap(breedCard.first);
      await tester.pumpAndSettle();

      // Verify the new current page is detail page.
      expect(Get.currentRoute, matches(breedDetailRoute));
    });
  });
}
