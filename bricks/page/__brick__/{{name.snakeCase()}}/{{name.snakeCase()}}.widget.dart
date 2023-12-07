import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '{{name.snakeCase()}}.controller.dart';

part '{{name.snakeCase()}}.style.dart';

class {{name.pascalCase()}}PageWidget extends GetView<{{name.pascalCase()}}PageController> {
  const {{name.pascalCase()}}PageWidget({super.key});

  @override
  Widget build(BuildContext context) => const Placeholder();
}
