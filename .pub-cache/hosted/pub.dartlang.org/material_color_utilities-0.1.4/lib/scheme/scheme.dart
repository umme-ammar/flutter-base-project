// Copyright 2021 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:material_color_utilities/palettes/core_palette.dart';

/// Prefer [ColorScheme]. This class is the same concept as Flutter's
/// ColorScheme class, inlined into libmonet to ensure parity across languages.
class Scheme {
  final int primary;
  final int onPrimary;
  final int primaryContainer;
  final int onPrimaryContainer;
  final int secondary;
  final int onSecondary;
  final int secondaryContainer;
  final int onSecondaryContainer;
  final int tertiary;
  final int onTertiary;
  final int tertiaryContainer;
  final int onTertiaryContainer;
  final int error;
  final int onError;
  final int errorContainer;
  final int onErrorContainer;
  final int background;
  final int onBackground;
  final int surface;
  final int onSurface;
  final int surfaceVariant;
  final int onSurfaceVariant;
  final int outline;
  final int shadow;
  final int inverseSurface;
  final int inverseOnSurface;
  final int inversePrimary;

  const Scheme({
    required this.primary,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.outline,
    required this.shadow,
    required this.inverseSurface,
    required this.inverseOnSurface,
    required this.inversePrimary,
  });

  static Scheme light(int color) => lightFromCorePalette(CorePalette.of(color));

  static Scheme dark(int color) => darkFromCorePalette(CorePalette.of(color));

  static Scheme lightFromCorePalette(CorePalette palette) => Scheme(
        primary: palette.primary.get(40),
        onPrimary: palette.primary.get(100),
        primaryContainer: palette.primary.get(90),
        onPrimaryContainer: palette.primary.get(10),
        secondary: palette.secondary.get(40),
        onSecondary: palette.secondary.get(100),
        secondaryContainer: palette.secondary.get(90),
        onSecondaryContainer: palette.secondary.get(10),
        tertiary: palette.tertiary.get(40),
        onTertiary: palette.tertiary.get(100),
        tertiaryContainer: palette.tertiary.get(90),
        onTertiaryContainer: palette.tertiary.get(10),
        error: palette.error.get(40),
        onError: palette.error.get(100),
        errorContainer: palette.error.get(90),
        onErrorContainer: palette.error.get(10),
        background: palette.neutral.get(99),
        onBackground: palette.neutral.get(10),
        surface: palette.neutral.get(99),
        onSurface: palette.neutral.get(10),
        surfaceVariant: palette.neutralVariant.get(90),
        onSurfaceVariant: palette.neutralVariant.get(30),
        outline: palette.neutralVariant.get(50),
        shadow: palette.neutral.get(0),
        inverseSurface: palette.neutral.get(20),
        inverseOnSurface: palette.neutral.get(95),
        inversePrimary: palette.primary.get(80),
      );

  static Scheme darkFromCorePalette(CorePalette palette) => Scheme(
        primary: palette.primary.get(80),
        onPrimary: palette.primary.get(20),
        primaryContainer: palette.primary.get(30),
        onPrimaryContainer: palette.primary.get(90),
        secondary: palette.secondary.get(80),
        onSecondary: palette.secondary.get(20),
        secondaryContainer: palette.secondary.get(30),
        onSecondaryContainer: palette.secondary.get(90),
        tertiary: palette.tertiary.get(80),
        onTertiary: palette.tertiary.get(20),
        tertiaryContainer: palette.tertiary.get(30),
        onTertiaryContainer: palette.tertiary.get(90),
        error: palette.error.get(80),
        onError: palette.error.get(20),
        errorContainer: palette.error.get(30),
        onErrorContainer: palette.error.get(80),
        background: palette.neutral.get(10),
        onBackground: palette.neutral.get(90),
        surface: palette.neutral.get(10),
        onSurface: palette.neutral.get(90),
        surfaceVariant: palette.neutralVariant.get(30),
        onSurfaceVariant: palette.neutralVariant.get(80),
        outline: palette.neutralVariant.get(60),
        shadow: palette.neutral.get(0),
        inverseSurface: palette.neutral.get(90),
        inverseOnSurface: palette.neutral.get(20),
        inversePrimary: palette.primary.get(40),
      );
}
