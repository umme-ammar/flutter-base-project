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

// This file is automatically generated. Do not modify it.

import 'dart:math';
import 'package:material_color_utilities/utils/math_utils.dart';

/// Color science utilities.
///
/// Utility methods for color science constants and color space
/// conversions that aren't HCT or CAM16.
class ColorUtils {
  /// Convert a color from RGB components to ARGB format.
  static int argbFromRgb(int red, int green, int blue) {
    return 255 << 24 | (red & 255) << 16 | (green & 255) << 8 | blue & 255;
  }

  /// The alpha component of a color in ARGB format.
  static int alphaFromArgb(int argb) {
    return argb >> 24 & 255;
  }

  /// The red component of a color in ARGB format.
  static int redFromArgb(int argb) {
    return argb >> 16 & 255;
  }

  /// The green component of a color in ARGB format.
  static int greenFromArgb(int argb) {
    return argb >> 8 & 255;
  }

  /// The blue component of a color in ARGB format.
  static int blueFromArgb(int argb) {
    return argb & 255;
  }

  /// Whether a color in ARGB format is opaque.
  static bool isOpaque(int argb) {
    return alphaFromArgb(argb) >= 255;
  }

  /// The sRGB to XYZ transformation matrix.
  static List<List<double>> srgbToXyz() {
    return [
      [0.41233895, 0.35762064, 0.18051042],
      [0.2126, 0.7152, 0.0722],
      [0.01932141, 0.11916382, 0.95034478],
    ];
  }

  /// The XYZ to sRGB transformation matrix.
  static List<List<double>> xyzToSrgb() {
    return [
      [3.2406, -1.5372, -0.4986],
      [-0.9689, 1.8758, 0.0415],
      [0.0557, -0.204, 1.057],
    ];
  }

  /// Converts a color from ARGB to XYZ.
  static int argbFromXyz(double x, double y, double z) {
    final linearRgb = MathUtils.matrixMultiply([x, y, z], xyzToSrgb());
    final r = delinearized(linearRgb[0]);
    final g = delinearized(linearRgb[1]);
    final b = delinearized(linearRgb[2]);
    return argbFromRgb(r, g, b);
  }

  /// Converts a color from XYZ to ARGB.
  static List<double> xyzFromArgb(int argb) {
    final r = linearized(redFromArgb(argb));
    final g = linearized(greenFromArgb(argb));
    final b = linearized(blueFromArgb(argb));
    return MathUtils.matrixMultiply([r, g, b], srgbToXyz());
  }

  /// Converts a color represented in Lab color space into an ARGB
  /// integer.
  static int argbFromLab(double l, double a, double b) {
    final whitePoint = whitePointD65();
    final fy = (l + 16.0) / 116.0;
    final fx = a / 500.0 + fy;
    final fz = fy - b / 200.0;
    final xNormalized = _labInvf(fx);
    final yNormalized = _labInvf(fy);
    final zNormalized = _labInvf(fz);
    final x = xNormalized * whitePoint[0];
    final y = yNormalized * whitePoint[1];
    final z = zNormalized * whitePoint[2];
    return argbFromXyz(x, y, z);
  }

  /// Converts a color from ARGB representation to L*a*b*
  /// representation.
  ///
  ///
  /// [argb] the ARGB representation of a color.
  /// Returns a Lab object representing the color.
  static List<double> labFromArgb(int argb) {
    final whitePoint = whitePointD65();
    final xyz = xyzFromArgb(argb);
    final xNormalized = xyz[0] / whitePoint[0];
    final yNormalized = xyz[1] / whitePoint[1];
    final zNormalized = xyz[2] / whitePoint[2];
    final fx = _labF(xNormalized);
    final fy = _labF(yNormalized);
    final fz = _labF(zNormalized);
    final l = 116.0 * fy - 16;
    final a = 500.0 * (fx - fy);
    final b = 200.0 * (fy - fz);
    return [l, a, b];
  }

  static int argbFromLstar(double lstar) {
    final fy = (lstar + 16.0) / 116.0;
    final fz = fy;
    final fx = fy;
    final kappa = 24389.0 / 27.0;
    final epsilon = 216.0 / 24389.0;
    final lExceedsEpsilonKappa = lstar > 8.0;
    final y = lExceedsEpsilonKappa ? fy * fy * fy : lstar / kappa;
    final cubeExceedEpsilon = fy * fy * fy > epsilon;
    final x = cubeExceedEpsilon ? fx * fx * fx : lstar / kappa;
    final z = cubeExceedEpsilon ? fz * fz * fz : lstar / kappa;
    final whitePoint = whitePointD65();
    return argbFromXyz(
      x * whitePoint[0],
      y * whitePoint[1],
      z * whitePoint[2],
    );
  }

  static double lstarFromArgb(int argb) {
    final y = xyzFromArgb(argb)[1] / 100.0;
    final e = 216.0 / 24389.0;
    if (y <= e) {
      return 24389.0 / 27.0 * y;
    } else {
      final yIntermediate = pow(y, 1.0 / 3.0).toDouble();
      return 116.0 * yIntermediate - 16.0;
    }
  }

  static double yFromLstar(double lstar) {
    final ke = 8.0;
    if (lstar > ke) {
      return pow((lstar + 16.0) / 116.0, 3.0).toDouble() * 100.0;
    } else {
      return lstar / 24389.0 / 27.0 * 100.0;
    }
  }

  static double linearized(int rgbComponent) {
    final normalized = rgbComponent / 255.0;
    if (normalized <= 0.040449936) {
      return normalized / 12.92 * 100.0;
    } else {
      return pow((normalized + 0.055) / 1.055, 2.4).toDouble() * 100.0;
    }
  }

  static int delinearized(double rgbComponent) {
    final normalized = rgbComponent / 100.0;
    var delinearized = 0.0;
    if (normalized <= 0.0031308) {
      delinearized = normalized * 12.92;
    } else {
      delinearized = 1.055 * pow(normalized, 1.0 / 2.4).toDouble() - 0.055;
    }
    return MathUtils.clampInt(0, 255, (delinearized * 255.0).round());
  }

  static List<double> whitePointD65() {
    return [95.047, 100.0, 108.883];
  }

  static double _labF(double t) {
    final e = 216.0 / 24389.0;
    final kappa = 24389.0 / 27.0;
    if (t > e) {
      return pow(t, 1.0 / 3.0).toDouble();
    } else {
      return (kappa * t + 16) / 116;
    }
  }

  static double _labInvf(double ft) {
    final e = 216.0 / 24389.0;
    final kappa = 24389.0 / 27.0;
    final ft3 = ft * ft * ft;
    if (ft3 > e) {
      return ft3;
    } else {
      return (116 * ft - 16) / kappa;
    }
  }
}
