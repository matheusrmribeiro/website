import 'package:flutter/material.dart';
import 'package:website/core/utils/sizing.dart';

import 'app_colors.dart';

class TextStyles {
  TextStyles({this.context});

  BuildContext? context;

  static const hintStyle = TextStyle(
      fontSize: 14,
      color: Colors.black54);

  final h1 = TextStyle(
      fontSize: 25,
      color: AppColors.white,
      fontWeight: FontWeight.w500);

  final h2 = TextStyle(
      fontSize: 20,
      color: AppColors.white,
      fontWeight: FontWeight.w500);

  final TextStyle hint = TextStyle(
      fontSize: 14,
      color: Colors.white,
      fontWeight: FontWeight.w500);

  final textWhite = TextStyle(
      fontSize: 15,
      color: AppColors.white,
      fontWeight: FontWeight.normal);

  get homeHeaderStyle => TextStyle(
      fontSize: (Sizing.widthPerc(0.1) * 0.45),
      color: AppColors.white,
      fontWeight: FontWeight.w600);

  get homeSubtitleStyle => TextStyle(
      fontSize: (Sizing.widthPerc(0.1) * 0.40),
      color: AppColors.secondaryTextColor,
      fontWeight: FontWeight.w100);

  TextStyle get homeDescriptionStyle => TextStyle(
      fontSize: (Sizing.widthPerc(0.1) * 0.15),
      color: AppColors.secondaryTextColor,
      fontWeight: FontWeight.normal);

  TextStyle get skillsTitleStyle => TextStyle(
      fontSize: Sizing.isMobile() ? 14 : 16,
      color: AppColors.white,
      fontWeight: FontWeight.bold);

  TextStyle get skillsStyle => TextStyle(
      fontSize: Sizing.isMobile() ? 14 : 16,
      color: AppColors.white,
      fontWeight: FontWeight.w100);

  TextStyle get projectNameStyle => TextStyle(
      fontSize: Sizing.isMobile() ? 14 : 16,
      color: AppColors.white,
      fontWeight: FontWeight.w600);

  TextStyle get projectDescriptionStyle => TextStyle(
      fontSize: Sizing.isMobile() ? 14 : 16,
      color: AppColors.secondaryTextColor,
      fontWeight: FontWeight.w100,
      overflow: TextOverflow.ellipsis
  );

  final hintText = TextStyle(
      fontSize: 16,
      color: AppColors.hintColor,
      fontWeight: FontWeight.w400);

  final hintTextBig = TextStyle(
      fontSize: 30,
      color: AppColors.hintColor,
      fontWeight: FontWeight.w400);

  final hoverIn = TextStyle(
      fontSize: 16,
      color: AppColors.white,
      fontWeight: FontWeight.w400);

  final hoverOut = TextStyle(
      fontSize: 16,
      color: AppColors.hintColor,
      fontWeight: FontWeight.w400);

}