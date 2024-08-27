import 'package:flutter/material.dart';

import '../../constant.dart';

class AppColors {
  static MaterialColor primaryColor =
      generateMaterialColor(const Color(0xFF1BA15B));
  static const Color white = Colors.white;
  static const Color whiteApplication = Color(0xFFFAFBFF);
  static const Color whiteWithGrey = Color(0xFFF2FAFF);

  // ----------------------------------------//

  static const Color greenPrimaryColor = Color(0xff37B9C5);
  static const Color lightGreenPrimaryColor = Color(0xffCBDFE1);
  static const Color yellowPrimaryColor = Color(0xffFFC618);
  static const Color lightYellowSecondaryColor = Color(0xffFFFAF3);
  static const Color lightGreenSecondaryColor = Color(0xffCBDFE1);
  static const Color red = Color(0xffFF5A5A);
  static const Color lightRed = Color(0xffE8D8D8);
  static const Color whiteBackground1 = Color(0xffFFFFFF);
  static const Color whiteBackground2 = Color(0xffF9FAFA);
  static const Color grey20 = Color(0xffF0F3F6);
  static const Color grey40 = Color(0xffD1D5DB);
  static const Color grey60 = Color(0xffADB3BC);
  static const Color grey80 = Color(0xff50555C);
  static const Color grey100 = Color(0xff111111);
  static const Color darkBlue = Color(0xff090F47);
  static const Color transparent = Colors.transparent;
  static const Color greenFont = Color.fromARGB(255, 28, 155, 166);
  static const Color yellowFont = Color.fromARGB(255, 219, 164, 2);
  // static MaterialColor grey =
  //     generateMaterialColor(const Color.fromARGB(255, 0, 0, 0));

//--------------------------------------------------------//
  static const Color hintTextColor = Color(0xFFAAB0BF);

  static const Color black = Color(0xFF303943);
  static const Color mainBlack = Colors.black;
  static const Color blue = Color(0xFF429BED);
  static const Color blue2 = Color(0xFF1FA7E4);

  static const Color brown = Color(0xFFB1736C);
  static const Color darkBrown = Color(0xD0795548);
  static const Color grey = Color(0x64303943);
  static const Color indigo = Color(0xFF6C79DB);
  static const Color lightBlue = Color(0xFF7AC7FF);
  static const Color lightBrown = Color(0xFFCA8179);
  static const Color whiteGrey = Color(0xFFFDFDFD);
  static const Color lightCyan = Color(0xFF98D8D8);
  static const Color lightGreen = Color(0xFF78C850);
  static const Color lighterGrey = Color(0xFFF4F5F4);
  static const Color lightGrey = Color(0xFFF5F5F5);
  static const Color lightPink = Color(0xFFEE99AC);
  static const Color lightPurple = Color(0xFF9F5BBA);
  static const Color lightTeal = Color(0xFF48D0B0);
  static const Color lightYellow = Color(0xFFFFCE4B);

  static const Color lilac = Color(0xFFA890F0);
  static const Color pink = Color(0xFFF85888);
  static const Color purple = Color(0xFF7C538C);
  static const Color teal = Color(0xFF4FC1A6);
  static const Color yellow = Color(0xFFF6C747);
  static const Color semiGrey = Color(0xFFbababa);
  static const Color violet = Color(0xD07038F8);

  static Color borderColor = const Color(0xFFCFCFCF);
  static Color hintColor = const Color(0xFFC0E8F4).withOpacity(0.5);
  static const Color mainColor = Color(0xFF201033);
  static const Color secondMainColor = Color(0xFFFFB546);
  static const Color thirdMainColor = Color(0xFF1AA15B);
  static const Color fourthMainColor = Color(0xFF828282);
  static const Color fifthMainColor = Color(0xFF5A5A5B);
  static const Color sixthMainColor = Color(0xFFFF5A8B);
  static const Color seventhMainColor = Color(0xFF00B6AA);

  static const Color infoColor = Color(0xFF0C9600);
  static const Color deleteIconColor = Color(0xFFFD0606);
  static const Color iconColorV1 = Color(0xFF2870FB);
  static const Color bgCardRateColor = Color(0xFFFAFBFF);
  static const Color grayLineSheet = Color(0xFFD9D9D9);
  static const Color red2 = Color(0xFFDA3960);

  static final Color shimmerColor = Colors.grey.shade100;
  static final Color baserColor = Colors.grey.shade300;
  static const Color cardColor = Colors.white;
  static const Color lightWhite = Color(0xFFD9D9D9);
  static const Color headerDatePickerColor = Color(0xFF7D8DA6);
  static const Color checkTrueColor = Color(0xFF73AF00);
  static const Color checkFalseColor = Color(0xFFFF4B55);
  static const Color startColor = Color(0xFFF5B22F);
  static const Color dropDownTitleColor = Color(0xFFA3A5A5);

  static const Color textButtonColor = Color(0xFFFC9774);
  static const Color textColor = Color(0xFF333333);
  static const Color textColor2 = Color(0xFFC0E8F4);
  static const Color textColor3 = Color(0xFFECF0F1);

  static Color shadowColor = const Color(0xFF2E436B);

  static const Color lineColor = Color(0xFFADADAD);
  static const Color lineColor2 = Color(0xFF82C3E1);
  static const Color lineColor3 = Color(0xFFF3F9FB);
  static const Color gray = Color(0xFFDADADA);
  static const Color darkGray = Color(0xFF5A5A5B);
  static const Color containerColor = Color(0xFFFFF9ED);
  static const Color containerColor2 = Color(0xFFEFF0F6);
  static const Color containerColor3 = Color(0xFFCAC4D0);
  static const Color containerColor4 = Color(0xFFFAFEFF);

  static const Color pendingColor = Color(0x33AAB0BF);
  static const Color completedColor = Color(0x331AA15B);
  static const Color cancelledColor = Color(0x33D43546);

  static const List<Color> gradiantBlue = [
    Color(0xFF4351DC),
    Color(0xFF474FD9),
    Color(0xFF1AA6D2),
    Color(0xFF1AA6D2),
    Color(0xFF37A5E3),
    Color(0xFF39B1F5),
    Color(0xFF4297FA),
    Color(0xFF4685FF)
  ];
  static const List<Color> gradiantGreen = [
    Color(0xFFFFA98C),
    Color(0xFFF79990),
    Color(0xFFE3719C),
    Color(0xFFC430AE),
    Color(0xFFAD00BD)
  ];

  static List<Color> gradiantBg = [
    const Color(0xFF2B1331).withOpacity(0.03),
    const Color(0xFF1A1337).withOpacity(0.5),
    const Color(0xFF0C0C24).withOpacity(0.98)
  ];

  static const Color primaryColorTheme = mainColor;
  static const Color colorAccentTheme = secondMainColor;
  static const Color backgroundColor = Color(0xFFFBFDFF);
  static const Color textColorTheme = Color(0xFFC0E8F4);
  static const Color lightGray = Color(0xFFABB0BF);
  static const Color fillColor = Color(0xFFEEF4F6);
  static const Color errorColor = Colors.red;
  static const Color dividerColor = Color(0xFFE6E6E6);
  static const Color tertiaryColor = Color(0xFF1FA7E4);

  static const Color backgroundColor2 = Color(0xFF021934);
  static const Color dialogBackgroundColor = Color(0xFF0A0F3A);
  static const Color backgroundColor3 = Color(0xFF140B2F);
  static const Color bottomSheetBackgroundColor = Color(0xFF1D182B);

  static OutlineInputBorder focusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(Constant.TextFieldBorder),
      borderSide: const BorderSide(
          strokeAlign: BorderSide.strokeAlignOutside,
          color: colorAccentTheme,
          width: Constant.TextFieldBorderWidth));

  static OutlineInputBorder enabledBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(Constant.TextFieldBorder),
      borderSide: BorderSide(
          strokeAlign: BorderSide.strokeAlignOutside,
          color: borderColor,
          width: Constant.TextFieldBorderWidth));

  static OutlineInputBorder errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(Constant.TextFieldBorder),
      borderSide: const BorderSide(
          strokeAlign: BorderSide.strokeAlignOutside,
          color: errorColor,
          width: Constant.TextFieldBorderWidth));

  static UnderlineInputBorder enableUnderLineBorder = UnderlineInputBorder(
      borderRadius: BorderRadius.circular(Constant.TextFieldBorder),
      borderSide:
          BorderSide(color: borderColor, width: Constant.TextFieldBorderWidth));

  static UnderlineInputBorder errorUnderLineBorder = UnderlineInputBorder(
      borderRadius: BorderRadius.circular(Constant.TextFieldBorder),
      borderSide: const BorderSide(
          color: errorColor, width: Constant.TextFieldBorderWidth));

  static UnderlineInputBorder focusUnderLineBorder = UnderlineInputBorder(
      borderRadius: BorderRadius.circular(Constant.TextFieldBorder),
      borderSide: const BorderSide(
          color: colorAccentTheme, width: Constant.TextFieldBorderWidth));

  static const errorStyle =
      TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: red);
}

MaterialColor generateMaterialColor(Color color) {
  List<Color> swatchColors = [
    color,
    color.withOpacity(0.8),
    color.withOpacity(0.6),
    color.withOpacity(0.4),
    color.withOpacity(0.2),
  ];

  return MaterialColor(color.value, <int, Color>{
    50: swatchColors[0],
    100: swatchColors[1],
    200: swatchColors[2],
    300: swatchColors[3],
    400: swatchColors[4],
    500: color,
    600: color.withOpacity(0.8),
    700: color.withOpacity(0.6),
    800: color.withOpacity(0.4),
    900: color.withOpacity(0.2),
  });
}
