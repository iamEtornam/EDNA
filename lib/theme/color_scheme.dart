import 'package:flutter/material.dart';

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF006878),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFA6EEFF),
  onPrimaryContainer: Color(0xFF001F25),
  secondary: Color(0xFF4B6268),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFCDE7EE),
  onSecondaryContainer: Color(0xFF051F24),
  tertiary: Color(0xFF555D7E),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFDCE1FF),
  onTertiaryContainer: Color(0xFF121A37),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFFBFCFD),
  onBackground: Color(0xFF191C1D),
  surface: Color(0xFFFBFCFD),
  onSurface: Color(0xFF191C1D),
  surfaceVariant: Color(0xFFDBE4E7),
  onSurfaceVariant: Color(0xFF3F484B),
  outline: Color(0xFF6F797B),
  onInverseSurface: Color(0xFFEFF1F2),
  inverseSurface: Color(0xFF2E3132),
  inversePrimary: Color(0xFF53D7F1),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF006878),
  outlineVariant: Color(0xFFBFC8CB),
  scrim: Color(0xFF000000),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF53D7F1),
  onPrimary: Color(0xFF00363F),
  primaryContainer: Color(0xFF004E5B),
  onPrimaryContainer: Color(0xFFA6EEFF),
  secondary: Color(0xFFB2CBD2),
  onSecondary: Color(0xFF1C3439),
  secondaryContainer: Color(0xFF334A50),
  onSecondaryContainer: Color(0xFFCDE7EE),
  tertiary: Color(0xFFBDC5EB),
  onTertiary: Color(0xFF272F4D),
  tertiaryContainer: Color(0xFF3D4565),
  onTertiaryContainer: Color(0xFFDCE1FF),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF191C1D),
  onBackground: Color(0xFFE1E3E4),
  surface: Color(0xFF191C1D),
  onSurface: Color(0xFFE1E3E4),
  surfaceVariant: Color(0xFF3F484B),
  onSurfaceVariant: Color(0xFFBFC8CB),
  outline: Color(0xFF899295),
  onInverseSurface: Color(0xFF191C1D),
  inverseSurface: Color(0xFFE1E3E4),
  inversePrimary: Color(0xFF006878),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF53D7F1),
  outlineVariant: Color(0xFF3F484B),
  scrim: Color(0xFF000000),
);


Color fromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}