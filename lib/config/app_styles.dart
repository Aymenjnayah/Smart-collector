import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppStyles{
  AppStyles._();
  // Font families
  static const String _fontFamily = 'Montserrat';

  // Font weights
  static const FontWeight _w400 = FontWeight.w400;
  static const FontWeight _w500 = FontWeight.w500;
  static const FontWeight _w600 = FontWeight.w600;
  static const FontWeight _w700 = FontWeight.w700;
  static const FontWeight _w800 = FontWeight.w800;


  // Font sizes
  static const double _textSize10 = 10.0;
  static const double _textSize12 = 12.0;
  static const double _textSize14 = 14.0;
  static const double _textSize16 = 16.0;
  static const double _textSize18 = 18.0;
  static const double _textSize20 = 20.0;
  static const double _textSize21 = 21.0;
  static const double _textSize24 = 24.0;



  static const TextStyle errorStyle = TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.errorColor,
    fontWeight: _w600,
    fontSize: _textSize14,
    fontStyle: FontStyle.italic,
  );
  static TextStyle welcomeTextStyle = const TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.primaryColor,
    fontWeight: _w500,
    height: 1.5,
    fontSize: _textSize20,
  );
  static TextStyle primary12W5Style = const TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.primaryColor,
    fontWeight: _w500,
    fontSize: _textSize12,
  );
  static TextStyle primary14W5Style = const TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.primaryColor,
    fontWeight: _w500,
    fontSize: _textSize14,
  );
  static TextStyle lightGrey14W5Style = const TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.lightGreyColor,
    fontWeight: _w500,
    fontSize: _textSize14,
  );
  static TextStyle whiteTitleStyle = const TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.whiteColor,
    fontWeight: _w500,
    fontSize: _textSize24,
  );
  static TextStyle white16W4Style = const TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.whiteColor,
    fontWeight: _w400,
    fontSize: _textSize16,
  );
  static TextStyle white18W4Style = const TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.whiteColor,
    fontWeight: _w400,
    fontSize: _textSize18,
  );
  static TextStyle white10W4Style = const TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.whiteColor,
    fontWeight: _w700,
    fontSize: _textSize16,
  );
  static TextStyle white18W8Style = const TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.whiteColor,
    fontWeight: _w800,
    fontSize: _textSize18,
  );
  static TextStyle white18W6Style = const TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.whiteColor,
    fontWeight: _w600,
    fontSize: _textSize18,
  );
  static TextStyle green10W7Style = const TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.primaryColor,
    fontWeight: _w700,
    fontSize: _textSize10,
  );
  static TextStyle white18W7Style = const TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.whiteColor,
    fontWeight: _w700,
    fontSize: _textSize18,
  );
  static TextStyle white21W7Style = const TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.whiteColor,
    fontWeight: _w700,
    fontSize: _textSize21,
  );
  static TextStyle white14W7Style = const TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.whiteColor,
    fontWeight: _w700,
    fontSize: _textSize14,
  );
  static TextStyle primary14W7Style = const TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.primaryColor,
    fontWeight: _w700,
    fontSize: _textSize14,
  );
  static TextStyle black14W7Style = const TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.blackColor,
    fontWeight: _w700,
    fontSize: _textSize14,
  );
  static TextStyle primary18W7Style = const TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.primaryColor,
    fontWeight: _w700,
    fontSize: _textSize18,
  );
  static TextStyle secondary18W7Style = const TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.secondaryColor,
    fontWeight: _w700,
    fontSize: _textSize18,
  );
  static TextStyle lineThroughNeutralBlack18W7Style = const TextStyle(
      fontFamily: _fontFamily,
      color: AppColors.neutralBlackColor,
      fontWeight: _w700,
      fontSize: _textSize18,
      decoration: TextDecoration.lineThrough
  );
  static TextStyle lineThroughNeutralBlack14W5Style = const TextStyle(
      fontFamily: _fontFamily,
      color: AppColors.neutralBlackColor,
      fontWeight: _w500,
      fontSize: _textSize14,
      decoration: TextDecoration.lineThrough
  );

  static TextStyle white24W7Style = const TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.whiteColor,
    fontWeight: _w700,
    fontSize: _textSize24,
  );
  static TextStyle green16W5Style = const TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.lightGreenColor,
    fontWeight: _w500,
    fontSize: _textSize16,
  );
  static TextStyle neutralBlack10W5Style = const TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.neutralBlackColor,
    fontWeight: _w500,
    fontSize: _textSize10,
  );
  static TextStyle neutralBlack14W5Style = const TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.neutralBlackColor,
    fontWeight: _w500,
    fontSize: _textSize14,
  );
  static TextStyle black14W5Style = const TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.blackColor,
    fontWeight: _w500,
    fontSize: _textSize14,
  );
  static TextStyle black18W6Style = const TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.blackColor,
    fontWeight: _w600,
    fontSize: _textSize18,
  );
  static TextStyle white14W5Style = const TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.whiteColor,
    fontWeight: _w500,
    fontSize: _textSize14,
  );
  static TextStyle white12W4Style = const TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.whiteColor,
    fontWeight: _w400,
    fontSize: _textSize12,
  );
  static TextStyle white16W8Style = const TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.whiteColor,
    fontWeight: _w800,
    fontSize: _textSize16,
  );
  static const TextStyle neutralBlack16W7Style = TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.neutralBlackColor,
    fontWeight: _w700,
    fontSize: _textSize16,
  );
  static TextStyle neutralBlack18W7Style = const TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.neutralBlackColor,
    fontWeight: _w700,
    fontSize: _textSize18,
  );
  static TextStyle neutralBlack20W6Style = const TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.neutralBlackColor,
    fontWeight: _w600,
    fontSize: _textSize20,
  );
  static const TextStyle neutralBlack14W4Style = TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.neutralBlackColor,
    fontWeight: _w400,
    fontSize: _textSize14,
  );
  static TextStyle primary14W6Style = const TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.primaryColor,
    fontWeight: _w600,
    fontSize: _textSize14,
  );
  static TextStyle red14W5Style = const TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.redColor,
    fontWeight: _w500,
    fontSize: _textSize14,
  );

  static TextStyle neutralBlack10W4Style = const TextStyle(
      fontFamily: _fontFamily,
      color: AppColors.neutralBlackColor,
      fontWeight: _w400,
      fontSize: _textSize10,
      decoration: TextDecoration.lineThrough
  );
  static TextStyle green16W8Style = const TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.primaryColor,
    fontWeight: _w800,
    fontSize: _textSize16,
  );


  static TextStyle black12W6Style = const TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.blackColor,
    fontWeight: _w600,
    fontSize: _textSize14,
    decoration: TextDecoration.underline,
  );

  static TextStyle black12W2Style = const TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.blackColor,
    fontWeight: _w600,
    fontSize: _textSize14,
    decoration: TextDecoration.underline,
  );

  static TextStyle terms = const TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.blackColor,
    fontWeight: _w400,
    fontSize: _textSize14,
  );
}