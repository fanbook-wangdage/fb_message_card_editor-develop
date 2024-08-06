import 'package:flutter/material.dart';

import 'const.dart';
import 'default_theme.dart';
import 'no_splash.dart';

/// 深色主题
class DarkTheme extends DefaultTheme {
  DarkTheme() {
    themeData = darkTheme;
    backgoundColor3 = const Color(0xFF1B1D20);
    backgoundColor4 = const Color(0xFF363940);
    backgoundColor5 = const Color(0xFF27292E);
  }
}

final headlineLarge = Typography.whiteCupertino.headlineLarge!.copyWith(
  fontSize: 24,
  fontWeight: FontWeight.bold,
);


final ThemeData darkTheme = ThemeData(
    fontFamily: "SourceHanSansCN",
    brightness: Brightness.dark,
    primarySwatch: primaryColor,
    primaryColor: primaryColor,
    highlightColor: Colors.transparent,
    splashFactory: const NoSplashFactory(),
    appBarTheme: const AppBarTheme(
      color: Color(0xFF1F2125),
      iconTheme: IconThemeData(color: Colors.white, size: 20),
      actionsIconTheme: IconThemeData(),
    ),
    dividerTheme: DividerThemeData(
        color: const Color(0xFFFFFFFF).withOpacity(0.06),
        space: 0,
        thickness: 0.5),
    scaffoldBackgroundColor: const Color(0xFF1F2125),
    // b1


    // b2
    iconTheme: const IconThemeData(color: Color(0xFF737780)),
    textTheme: TextTheme(
      headlineLarge: Typography.whiteCupertino.headlineLarge!.copyWith(
          fontSize: 22, fontWeight: FontWeight.w500, color: Colors.white),

      headlineSmall: Typography.whiteCupertino.headlineSmall!.copyWith(
          fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),

      /// 灰色字体
      bodyLarge: Typography.whiteCupertino.bodyLarge!.copyWith(
        color: const Color(0xFF8F959E),
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),

      /// [已修订]
      /// 深色字体
      bodyMedium: Typography.whiteCupertino.bodyMedium!.copyWith(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
    ),
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(btnBorderRadius)),
    ),
    hintColor: const Color(0xFFD9D9D9),
    dialogBackgroundColor: const Color(0xFF363940));
