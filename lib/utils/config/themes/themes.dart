import 'package:book_reading_flutter/utils/constants/constants.dart';
import 'package:flutter/material.dart';

class Themes {
  static ThemeData lightTheme = ThemeData(
    primaryColor: ColorConstants.accent,
    scaffoldBackgroundColor: ColorConstants.white,
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        fontSize: SizesConstants.s28,
        color: ColorConstants.black,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        fontSize: SizesConstants.s14,
        color: ColorConstants.black,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        fontSize: SizesConstants.s12,
        color: ColorConstants.grey,
        fontWeight: FontWeight.w500,
      ),
      labelLarge: TextStyle(
        fontSize: SizesConstants.s14,
        color: ColorConstants.white,
        fontWeight: FontWeight.w500,
      ),
      labelMedium: TextStyle(
        fontSize: SizesConstants.s12,
        color: ColorConstants.grey,
        fontWeight: FontWeight.w500,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: ColorConstants.accent,
    scaffoldBackgroundColor: ColorConstants.black,
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        fontSize: SizesConstants.s28,
        color: ColorConstants.white,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        fontSize: SizesConstants.s14,
        color: ColorConstants.grey,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        fontSize: SizesConstants.s12,
        color: ColorConstants.grey,
        fontWeight: FontWeight.w500,
      ),
      labelLarge: TextStyle(
        fontSize: SizesConstants.s14,
        color: ColorConstants.white,
        fontWeight: FontWeight.w500,
      ),
      labelMedium: TextStyle(
        fontSize: SizesConstants.s12,
        color: ColorConstants.grey,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
