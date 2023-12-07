import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dimensions.token.dart';

enum CustomText {
  h1(fontSize: CustomFontDimension.xxl, fontWeight: FontWeight.bold),
  h2(fontSize: CustomFontDimension.xl, fontWeight: FontWeight.bold),
  body(fontSize: CustomFontDimension.lg),
  caption(fontSize: CustomFontDimension.md, fontWeight: FontWeight.normal);

  final CustomFontDimension fontSize;
  final FontWeight fontWeight;

  const CustomText({required this.fontSize, this.fontWeight = FontWeight.w600});

  TextStyle get style => GoogleFonts.plusJakartaSans(
        fontSize: fontSize.value,
        fontWeight: fontWeight,
      );
}
