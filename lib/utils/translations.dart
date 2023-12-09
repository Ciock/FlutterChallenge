import 'package:get/get.dart';

import '../design/components/components.translations.dart';
import '../pages/breed_detail/breed_detail.translations.dart';
import '../pages/home/home.translations.dart';
import '../pages/sub_breed_detail/sub_breed_detail.translations.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          ...ComponentsTranslations.en,
          ...BreedDetailPageTranslations.en,
          ...HomePageTranslations.en,
          ...SubBreedDetailPageTranslations.en,
        },
        'it': {
          ...ComponentsTranslations.it,
          ...BreedDetailPageTranslations.it,
          ...HomePageTranslations.it,
          ...SubBreedDetailPageTranslations.it,
        },
      };
}
