import 'package:flutter/material.dart';
import 'package:pharmachy_app/core/widgets/style/color.dart';

class AppTheme {
  static _border({required Color color}) {
    return UnderlineInputBorder(borderSide: BorderSide(color: color, width: 1));
  }

  static final ThemeData ligthTheme = ThemeData.light().copyWith(
      // colorScheme: ColorScheme(brightness: Brightness.light, primary: AppColo, onPrimary: onPrimary, secondary: secondary, onSecondary: onSecondary, error: error, onError: onError, background: background, onBackground: onBackground, surface: surface, onSurface: onSurface),
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.greenPrimaryColor),
      scaffoldBackgroundColor: AppColors.whiteBackground1,
      inputDecorationTheme: InputDecorationTheme(
          focusedBorder: _border(color: AppColors.greenPrimaryColor),
          enabledBorder: _border(color: AppColors.grey40),
          errorBorder: _border(color: AppColors.red)),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 40,
          color: AppColors.grey100,
        ),
        displayMedium: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 28,
          color: AppColors.grey100,
        ),
        displaySmall: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: AppColors.grey100,
        ),
        headlineMedium: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: AppColors.grey100,
        ),
        titleLarge: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: AppColors.grey100,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          color: AppColors.grey100,
        ),
        bodySmall: TextStyle(
          fontSize: 14,
          color: AppColors.grey100,
        ),
      ));

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColorTheme,
    switchTheme: SwitchThemeData(
      trackColor: MaterialStateProperty.all<Color>(Colors.grey),
      thumbColor: MaterialStateProperty.all<Color>(Colors.white),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide.none),
      filled: true,
      fillColor: Colors.grey.withOpacity(0.1),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0)),
            shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0))),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            overlayColor: MaterialStateProperty.all<Color>(Colors.black26))),
  );
}



// static final ThemeData lightTheme = ThemeData(
//       brightness: Brightness.light,

//       // for app bar
//       primaryColor: primaryColorTheme,
//       secondaryHeaderColor: secondMainColor,

//      colorScheme: ColorScheme.fromSeed(seedColor: primaryColorTheme,
//      primary: primaryColorTheme,
//      onPrimary: backgroundColor,
//      secondary: backgroundColor,
//        onSecondary: textColor,
//        tertiary:tertiaryColor,
//      ),

//       hintColor: hintColor,

//       tabBarTheme: TabBarTheme(
//         labelColor: primaryColor,
//         indicatorColor: primaryColor,
//         unselectedLabelColor: lightGray,
//         // indicatorSize: TabBarIndicatorSize.label,
//         // indicatorWeight: 2.0,
//         dividerColor: Colors.transparent,
//       ),


//       primarySwatch: AppColors.primaryColor,
//       useMaterial3: true,
//       fontFamily: AppLanguageKeys.appLang.value == AR
//           ? Almarai : SFPro,
//       scaffoldBackgroundColor: backgroundColor,
//       dividerColor: lightGray,


//       iconTheme: const IconThemeData(
//         color: lightGray, // Set the default color for icons
//         size: 24.0, // Set the default size for icons
//       ),


//       primaryIconTheme: const IconThemeData(
//         color: primaryColorTheme, // Set the default color for icons
//         size: 24.0, // Set the default size for icons
//       ),


//       // for FAB and secondary button
//       floatingActionButtonTheme: const FloatingActionButtonThemeData(
//           backgroundColor: colorAccentTheme
//       ),

//       appBarTheme: const AppBarTheme(
//         color: primaryColorTheme,
//         titleTextStyle: TextStyle(
//             color: backgroundColor,
//             fontSize: 16,
//             fontWeight: FontWeight.w400),
//             iconTheme: IconThemeData(color: backgroundColor),
//       ),

//     // actionIconTheme: ActionIconThemeData(
//     //   backButtonIcon: Icon(Icons.arrow_back, color: Colors.white),
//     //   closeButtonIcon: Icon(Icons.cancel, color: Colors.white),
//     //   drawerButtonIcon: Icon(Icons.list, color: Colors.white),
//     //   endDrawerButtonIcon: Icon(Icons.settings, color: Colors.white),
//     // ),
//     textTheme: const TextTheme(
//       //headline1:
//       displayMedium:TextStyle(fontSize: 32.0, fontWeight: FontWeight.w600, color: textColorTheme),
//       //headline2:
//       displaySmall:TextStyle(fontSize: 26.0, fontWeight: FontWeight.w600, color: textColorTheme),
//       //headline3:
//       headlineMedium:TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500, color: textColorTheme),


//      // bodyText1:
//       bodyMedium:TextStyle(fontSize: 16.0,fontWeight: FontWeight.w500, color: textColorTheme),

//       // text inside all buttons
//       bodyLarge: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w700, color: white),

//       //bodyText2:
//       // for Text Field + Hint
//       bodySmall:TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, color: textColorTheme),


//     //caption:
//     // error message
//     labelLarge:TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500, color: textColorTheme)
//     ),


//       dialogTheme: DialogTheme(
//         shape: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: BorderSide.none
//         ),
//         backgroundColor: backgroundColor,
//         elevation: 0
//       ),

//       //
//       //  textButtonTheme: TextButtonThemeData(
//       //     style: TextButton.styleFrom(primary: black),
//       //   ),


//       //
//       //  outlinedButtonTheme: OutlinedButtonThemeData(
//       //     style: TextButton.styleFrom(
//       //       primary: black,
//       //       side: BorderSide(color: black, width: 1),
//       //     ),
//       //   ),


//       //
//       //  textSelectionTheme: TextSelectionThemeData(
//       //     cursorColor: Constants.black,
//       //     selectionColor: Colors.blue.shade200,
//       //   ),





//       elevatedButtonTheme: ElevatedButtonThemeData(
//           style: ButtonStyle(
//               padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
//                   EdgeInsets.zero
//               ),
//               shape: MaterialStateProperty.all<OutlinedBorder>(
//                   RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0))
//               ),
//               backgroundColor: MaterialStateProperty.all<Color>(colorAccentTheme)
//           )
//       ),


//       pageTransitionsTheme: const PageTransitionsTheme(
//         builders: {
//           TargetPlatform.android: CupertinoPageTransitionsBuilder(),
//           TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
//         },
//       ),


//       //    tabBarTheme: TabBarTheme(
//       //               labelStyle: TextStyle(
//       //                   color: AppColors.iconColorV1,
//       //                   fontSize: 14.sp,
//       //                   fontFamily: AppLanguageKeys.appLang.value == AR
//       //                       ? Almarai : SFPro,
//       //                   fontWeight: FontWeight.w600)
//       //             ),

//       inputDecorationTheme: InputDecorationTheme(
//           border: enabledBorder,
//           floatingLabelBehavior: FloatingLabelBehavior.always,
//           errorStyle: errorStyle,
//           focusColor: primaryColorTheme,
//           filled: true,
//           fillColor:transparent,
//         prefixIconColor: primaryColorTheme,
//         isDense: true,
//         focusedBorder: focusedBorder,
//         enabledBorder: enabledBorder,
//         disabledBorder: enabledBorder,
//         errorBorder: errorBorder,
//         focusedErrorBorder: errorBorder,

//         contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14)

//       )
//   );
