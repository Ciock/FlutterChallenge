/// A set of border dimensions.
/// Use it to define the width of an element's borders.
///
/// Use [CustomBorderDimension.md.value] to access double value.
enum CustomBorderDimension {
  /// 1
  sm(1),

  /// 2
  md(2),

  /// 4
  lg(4);

  final double value;

  const CustomBorderDimension(this.value);
}

/// A set of font size dimensions.
/// Use it to define the size of a text.
///
/// Use [CustomFontDimension.md.value] to access double value.
enum CustomFontDimension {
  /// 12
  sm(12),

  /// 14
  md(14),

  /// 16
  lg(16),

  /// 16
  xl(24),

  /// 32
  xxl(32);

  final double value;

  const CustomFontDimension(this.value);
}

/// A set of radius dimensions.
/// Use it to define the radius of an element's corners.
///
/// Use [CustomRadiusDimension.md.value] to access double value.
enum CustomRadiusDimension {
  /// 4
  sm(4),

  /// 8
  md(8),

  /// 16
  lg(16),

  /// Big value to create a circle shape
  circle(999999);

  final double value;

  const CustomRadiusDimension(this.value);
}

/// A set of space dimensions.
/// Use it to define an empty space between elements.
///
/// Use [CustomSpaceDimension.md.value] to access double value.
enum CustomSpaceDimension {
  /// 4
  sm(4),

  /// 8
  md(8),

  /// 16
  lg(16),

  /// 32
  xl(32);

  final double value;

  const CustomSpaceDimension(this.value);
}

/// A set of ratio dimensions.
/// Use it to define an [AspectRatio] widget.
///
/// Use [CustomRatioDimension.tall.value] to access double value.
enum CustomRatioDimension {
  /// 4/3
  wide(4 / 3),

  /// 3/4
  tall(3 / 4);

  final double value;

  const CustomRatioDimension(this.value);
}
