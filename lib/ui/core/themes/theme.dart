import 'package:cgr_core_flutter/cgr_core_flutter.dart';

abstract final class CGRTheme {
  static ThemeData theme({
    required Brightness brightness,
    required Color primary,
    required Color secondary,
    required Color surface,
  }) {
    return ThemeData(
      brightness: brightness,
      useMaterial3: false,
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: primary,
        onPrimary: brightness == Brightness.dark
            ? CGRColors.black
            : CGRColors.white,
        secondary: secondary,
        onSecondary: CGRColors.white,
        error: CGRColors.red,
        onError: CGRColors.white,
        surface: surface,
        onSurface: brightness == Brightness.dark
            ? CGRColors.white
            : CGRColors.black,
      ),
    );
  }
}
