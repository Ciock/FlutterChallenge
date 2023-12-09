import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../tokens/dimensions.token.dart';
import '../tokens/texts.token.dart';

class SmallHeader extends StatelessWidget {
  final String title;

  const SmallHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Colors.grey)),
        ),
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top +
              CustomSpaceDimension.lg.value,
          bottom: CustomSpaceDimension.lg.value,
          right: CustomSpaceDimension.lg.value,
          left: CustomSpaceDimension.lg.value,
        ),
        child: Row(
          children: [
            Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: CustomText.h1.style,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close),
              color: Colors.black,
              onPressed: Get.back,
            ),
          ],
        ),
      );
}
