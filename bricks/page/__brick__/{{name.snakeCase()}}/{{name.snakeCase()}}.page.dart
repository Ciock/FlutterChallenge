import 'package:get/get.dart';

import '{{name.snakeCase()}}.controller.dart';
import '{{name.snakeCase()}}.widget.dart';

final {{name.camelCase()}}Page = GetPage(
  binding: {{name.pascalCase()}}PageBinding(),
  name: '/${{name.camelCase()}}Route',
  page: {{name.pascalCase()}}PageWidget.new,
);

const {{name.camelCase()}}Route = '{{name.camelCase()}}';

class {{name.pascalCase()}}PageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<{{name.pascalCase()}}PageController>({{name.pascalCase()}}PageController.new);
  }
}
