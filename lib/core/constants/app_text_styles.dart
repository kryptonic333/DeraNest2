import 'package:deranest/core/constants/app_fonts.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  static const TextStyle kHeadingText = TextStyle(
    fontSize: 22,
    fontFamily: AppFonts.kBold,
  );
  static final TextStyle kVeryLargeBodyText = TextStyle(
    fontSize: 20,
    fontFamily: AppFonts.kMedium,
  );
  static const TextStyle kLargeBodyText = TextStyle(
    fontSize: 18,
    fontFamily: AppFonts.kRegular,
  );
  static const TextStyle kMediumBodyText = TextStyle(
    fontSize: 16,
    fontFamily: AppFonts.kRegular,
  );
  static const TextStyle kDefaultBodyText = TextStyle(
    fontSize: 14,
    fontFamily: AppFonts.kRegular,
  );
  static const TextStyle kSmallBodyText = TextStyle(
    fontSize: 12,
    fontFamily: AppFonts.kRegular,
  );
  static const TextStyle kVerySmallBodyText = TextStyle(
    fontSize: 10,
    fontFamily: AppFonts.kRegular,
  );
}
