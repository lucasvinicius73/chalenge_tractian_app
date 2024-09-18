import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff004f9d),
      surfaceTint: Color(0xff005db7),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff0073e0),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff425f8e),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffb5ceff),
      onSecondaryContainer: Color(0xff1b3b68),
      tertiary: Color(0xff7d229e),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffa74dc6),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfff9f9ff),
      onSurface: Color(0xff181c23),
      onSurfaceVariant: Color(0xff414754),
      outline: Color(0xff717785),
      outlineVariant: Color(0xffc1c6d6),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d3038),
      inversePrimary: Color(0xffa9c7ff),
      primaryFixed: Color(0xffd6e3ff),
      onPrimaryFixed: Color(0xff001b3d),
      primaryFixedDim: Color(0xffa9c7ff),
      onPrimaryFixedVariant: Color(0xff00468c),
      secondaryFixed: Color(0xffd6e3ff),
      onSecondaryFixed: Color(0xff001b3d),
      secondaryFixedDim: Color(0xffaac7fd),
      onSecondaryFixedVariant: Color(0xff294775),
      tertiaryFixed: Color(0xfffad7ff),
      onTertiaryFixed: Color(0xff330045),
      tertiaryFixedDim: Color(0xffefb0ff),
      onTertiaryFixedVariant: Color(0xff731493),
      surfaceDim: Color(0xffd7dae4),
      surfaceBright: Color(0xfff9f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff1f3fd),
      surfaceContainer: Color(0xffebedf8),
      surfaceContainerHigh: Color(0xffe6e8f2),
      surfaceContainerHighest: Color(0xffe0e2ec),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff004285),
      surfaceTint: Color(0xff005db7),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff0073e0),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff244371),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff5975a6),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff6e0b8f),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffa74dc6),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff9f9ff),
      onSurface: Color(0xff181c23),
      onSurfaceVariant: Color(0xff3d4350),
      outline: Color(0xff595f6d),
      outlineVariant: Color(0xff757b89),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d3038),
      inversePrimary: Color(0xffa9c7ff),
      primaryFixed: Color(0xff0073e0),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff005bb3),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff5975a6),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff3f5c8c),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xffa74dc6),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff8b31ab),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd7dae4),
      surfaceBright: Color(0xfff9f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff1f3fd),
      surfaceContainer: Color(0xffebedf8),
      surfaceContainerHigh: Color(0xffe6e8f2),
      surfaceContainerHighest: Color(0xffe0e2ec),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff00224a),
      surfaceTint: Color(0xff005db7),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff004285),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff00224a),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff244371),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff3d0052),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff6e0b8f),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff9f9ff),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff1e2430),
      outline: Color(0xff3d4350),
      outlineVariant: Color(0xff3d4350),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d3038),
      inversePrimary: Color(0xffe5ecff),
      primaryFixed: Color(0xff004285),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff002c5d),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff244371),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff072c59),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff6e0b8f),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff4e0067),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd7dae4),
      surfaceBright: Color(0xfff9f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff1f3fd),
      surfaceContainer: Color(0xffebedf8),
      surfaceContainerHigh: Color(0xffe6e8f2),
      surfaceContainerHighest: Color(0xffe0e2ec),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffa9c7ff),
      surfaceTint: Color(0xffa9c7ff),
      onPrimary: Color(0xff003063),
      primaryContainer: Color(0xff0073e0),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xffaac7fd),
      onSecondary: Color(0xff0d305d),
      secondaryContainer: Color(0xff203f6d),
      onSecondaryContainer: Color(0xffbfd4ff),
      tertiary: Color(0xffefb0ff),
      onTertiary: Color(0xff53006e),
      tertiaryContainer: Color(0xffa74dc6),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff10131a),
      onSurface: Color(0xffe0e2ec),
      onSurfaceVariant: Color(0xffc1c6d6),
      outline: Color(0xff8b919f),
      outlineVariant: Color(0xff414754),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e2ec),
      inversePrimary: Color(0xff005db7),
      primaryFixed: Color(0xffd6e3ff),
      onPrimaryFixed: Color(0xff001b3d),
      primaryFixedDim: Color(0xffa9c7ff),
      onPrimaryFixedVariant: Color(0xff00468c),
      secondaryFixed: Color(0xffd6e3ff),
      onSecondaryFixed: Color(0xff001b3d),
      secondaryFixedDim: Color(0xffaac7fd),
      onSecondaryFixedVariant: Color(0xff294775),
      tertiaryFixed: Color(0xfffad7ff),
      onTertiaryFixed: Color(0xff330045),
      tertiaryFixedDim: Color(0xffefb0ff),
      onTertiaryFixedVariant: Color(0xff731493),
      surfaceDim: Color(0xff10131a),
      surfaceBright: Color(0xff363941),
      surfaceContainerLowest: Color(0xff0b0e15),
      surfaceContainerLow: Color(0xff181c23),
      surfaceContainer: Color(0xff1c2027),
      surfaceContainerHigh: Color(0xff272a31),
      surfaceContainerHighest: Color(0xff31353d),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffb0cbff),
      surfaceTint: Color(0xffa9c7ff),
      onPrimary: Color(0xff001634),
      primaryContainer: Color(0xff3d90ff),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffb0cbff),
      onSecondary: Color(0xff001634),
      secondaryContainer: Color(0xff7591c4),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfff0b6ff),
      onTertiary: Color(0xff2b003a),
      tertiaryContainer: Color(0xffc66be5),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff10131a),
      onSurface: Color(0xfffbfaff),
      onSurfaceVariant: Color(0xffc5cbda),
      outline: Color(0xff9da3b2),
      outlineVariant: Color(0xff7d8392),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e2ec),
      inversePrimary: Color(0xff00478e),
      primaryFixed: Color(0xffd6e3ff),
      onPrimaryFixed: Color(0xff00112a),
      primaryFixedDim: Color(0xffa9c7ff),
      onPrimaryFixedVariant: Color(0xff00356e),
      secondaryFixed: Color(0xffd6e3ff),
      onSecondaryFixed: Color(0xff00112a),
      secondaryFixedDim: Color(0xffaac7fd),
      onSecondaryFixedVariant: Color(0xff153663),
      tertiaryFixed: Color(0xfffad7ff),
      onTertiaryFixed: Color(0xff230030),
      tertiaryFixedDim: Color(0xffefb0ff),
      onTertiaryFixedVariant: Color(0xff5c007a),
      surfaceDim: Color(0xff10131a),
      surfaceBright: Color(0xff363941),
      surfaceContainerLowest: Color(0xff0b0e15),
      surfaceContainerLow: Color(0xff181c23),
      surfaceContainer: Color(0xff1c2027),
      surfaceContainerHigh: Color(0xff272a31),
      surfaceContainerHighest: Color(0xff31353d),
      
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffbfaff),
      surfaceTint: Color(0xffa9c7ff),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffb0cbff),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffbfaff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffb0cbff),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffff9fa),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xfff0b6ff),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff10131a),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfffbfaff),
      outline: Color(0xffc5cbda),
      outlineVariant: Color(0xffc5cbda),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e2ec),
      inversePrimary: Color(0xff002958),
      primaryFixed: Color(0xffdde7ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffb0cbff),
      onPrimaryFixedVariant: Color(0xff001634),
      secondaryFixed: Color(0xffdde7ff),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffb0cbff),
      onSecondaryFixedVariant: Color(0xff001634),
      tertiaryFixed: Color(0xfffbddff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xfff0b6ff),
      onTertiaryFixedVariant: Color(0xff2b003a),
      surfaceDim: Color(0xff10131a),
      surfaceBright: Color(0xff363941),
      surfaceContainerLowest: Color(0xff0b0e15),
      surfaceContainerLow: Color(0xff181c23),
      surfaceContainer: Color(0xff1c2027),
      surfaceContainerHigh: Color(0xff272a31),
      surfaceContainerHighest: Color(0xff31353d),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.surface,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
