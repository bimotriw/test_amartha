import 'package:flutter/material.dart';

class MyThemes {
  static final lightTheme = ThemeData(
    fontFamily: 'Inter',
    scaffoldBackgroundColor: Colors.white,
    primaryColor: AppColor.primary,
    colorScheme: ThemeData.light().colorScheme.copyWith(
          primary: AppColor.primaryLight,
        ),
    textTheme: const TextTheme(
      bodyText2: TextStyle(
        fontSize: 18,
      ),
    ),
    unselectedWidgetColor: AppColor.primary,
    dividerTheme: const DividerThemeData(
      color: AppColor.grey,
      thickness: 1,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.primary,
      elevation: 1,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    ),
    shadowColor: Colors.transparent,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith(
            (states) => _defaultTextColorButton(states)),
        backgroundColor: MaterialStateProperty.resolveWith(
            (states) => _defaultColor(states)),
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) =>
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(90))),
        textStyle: MaterialStateProperty.resolveWith(
          (states) => const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
            (states) => const EdgeInsets.symmetric(vertical: 16)),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.primary,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith(
            (states) => _defaultTextColorButton(states)),
        side: MaterialStateProperty.resolveWith((states) => const BorderSide(
              width: 1,
              color: Colors.black,
            )),
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) =>
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(90))),
        textStyle: MaterialStateProperty.resolveWith(
          (states) => const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
            (states) => const EdgeInsets.symmetric(vertical: 14)),
      ),
    ),
    buttonTheme: ButtonThemeData(
      padding: const EdgeInsets.symmetric(vertical: 14),
      buttonColor: AppColor.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(90),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith(
            (states) => AppColor.primaryLight),
        textStyle: MaterialStateProperty.resolveWith(
          (states) => const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
            (states) => const EdgeInsets.symmetric(vertical: 14)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      hintStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      alignLabelWithHint: true,
      labelStyle: const TextStyle(
        color: Color.fromRGBO(187, 189, 193, 1),
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ).copyWith(top: 20),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColor.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColor.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColor.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColor.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColor.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColor.grey),
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}

Color _defaultColor(Set<MaterialState> states) {
  if (states.contains(MaterialState.disabled)) {
    return AppColor.greyNonActiveButton;
  }
  return AppColor.primary;
}

Color _defaultTextColorButton(Set<MaterialState> states) {
  if (states.contains(MaterialState.disabled)) {
    return AppColor.greyNonActiveText;
  }
  return Colors.black;
}

class AppColor {
  static const primary = Color.fromRGBO(127, 63, 152, 1);
  static const primaryLight = Color.fromRGBO(181, 111, 209, 1);
  static const grey = Color.fromRGBO(217, 222, 226, 1);
  static const greyNonActiveText = Color.fromRGBO(130, 134, 141, 1);
  static const greyNonActiveButton = Color.fromRGBO(234, 234, 235, 1);
}
