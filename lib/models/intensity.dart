enum Intensity {
  superLight,
  light,
  regular,
  strong,
  reallyStrong,
  dangerous
}

extension IntensityExtension on Intensity {
  String get name {
    switch (this) {
      case Intensity.superLight:
        return "reallyLight";
      case Intensity.light:
        return "light";
      case Intensity.regular:
        return "regular";
      case Intensity.strong:
        return "strong";
      case Intensity.reallyStrong:
        return "reallyStrong";
      case Intensity.dangerous:
        return "dangerous";
    }
  }
}