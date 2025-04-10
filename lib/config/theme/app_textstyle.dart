import 'package:flutter/material.dart';

import '../app_sizer.dart';
import 'app_colors.dart';

class AppTextStyles {
  final BuildContext? context;

  late final TextStyle menuRegular;
  late final TextStyle menuBold;
  late final TextStyle captionRegular;
  late final TextStyle captionBold;
  late final TextStyle bodySmallUnderlineRegular;
  late final TextStyle bodySmallRegular;
  late final TextStyle bodySmallBold;
  late final TextStyle bodyLargeUnderlineRegular;
  late final TextStyle bodyLargeRegular;
  late final TextStyle bodyRegular;
  late final TextStyle bodyLargeBold;
  late final TextStyle bodyHeadTitle;
  late final TextStyle titleRegular;
  late final TextStyle titleBold;
  late final TextStyle headlineRegular;
  late final TextStyle headlineBold;
  late final TextStyle displayOneRegular;
  late final TextStyle displayOneBold;
  late final TextStyle displayTwoRegular;
  late final TextStyle displayTwoBold;
  late final TextStyle displayThreeRegular;
  late final TextStyle displayThreeBold;
  late final TextStyle displayForthRegular;
  late final TextStyle textFieldLabel;
  late final TextStyle textFieldHint;
  late final TextStyle textFieldError;
  late final TextStyle textLabel;
  late final TextStyle textHeader;
  late final TextStyle display6W400;
  late final TextStyle display14W400;
  late final TextStyle display10W400;
  late final TextStyle display8W400;
  late final TextStyle display9W400;
  late final TextStyle display10W500;
  late final TextStyle display11W500;
  late final TextStyle display11W600;
  late final TextStyle display11W400;
  late final TextStyle display11W300;
  late final TextStyle display11W800;
  late final TextStyle display12W400;
  late final TextStyle display12W500;
  late final TextStyle display12W600;
  late final TextStyle display12W700;
  late final TextStyle display12W800;
  late final TextStyle display13W400;
  late final TextStyle display13W500;
  late final TextStyle display13W600;
  late final TextStyle display13W700;
  late final TextStyle display14W500;
  late final TextStyle display14W300;
  late final TextStyle display14W600;
  late final TextStyle display14W700;
  late final TextStyle display14W800;
  late final TextStyle display15W400;
  late final TextStyle display15W500;
  late final TextStyle display15W600;
  late final TextStyle display15W700;
  late final TextStyle display16W300;
  late final TextStyle display16W400;
  late final TextStyle display16W500;
  late final TextStyle display16W600;
  late final TextStyle display16W700;
  late final TextStyle display17W400;
  late final TextStyle display17W500;
  late final TextStyle display17W600;
  late final TextStyle display17W700;
  late final TextStyle display18W600;
  late final TextStyle display18W500;
  late final TextStyle display18W400;
  late final TextStyle display18W700;
  late final TextStyle display20W400;
  late final TextStyle display20W500;
  late final TextStyle display20W600;
  late final TextStyle display21W600;
  late final TextStyle display20W700;
  late final TextStyle display22W400;
  late final TextStyle display22W600;
  late final TextStyle display22W700;
  late final TextStyle display24W400;
  late final TextStyle display24W500;
  late final TextStyle display24W600;
  late final TextStyle display24W700;
  late final TextStyle display30W400;
  late final TextStyle display30W700;
  late final TextStyle display32W500;
  late final TextStyle display32W600;
  late final TextStyle display32W700;
  late final TextStyle display36W700;
  late final TextStyle display52W500;

  AppTextStyles(this.context) {
    displayForthRegular = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontSize: AppSizes.font_46,
          color: AppColors.black,
          fontWeight: FontWeight.w400,
        );
    textFieldLabel = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: AppSizes.font_14,
          color: AppColors.black,
          fontWeight: FontWeight.w400,
        );

    textFieldHint = Theme.of(context!).textTheme.displayMedium!.copyWith(
          fontSize: AppSizes.font_12,
          color: AppColors.black,
          fontWeight: FontWeight.w400,
          fontFamily: BaseFonts.SFPro,
        );
    textFieldError = Theme.of(context!).textTheme.displayMedium!.copyWith(
          fontWeight: FontWeight.w400,
          fontFamily: BaseFonts.SFPro,
          color: AppColors.danger,
          fontSize: AppSizes.font_10,
        );
    textLabel = Theme.of(context!).textTheme.displaySmall!.copyWith(
          fontWeight: FontWeight.w400,
          fontFamily: BaseFonts.SFPro,
          color: AppColors.secondaryColor,
          fontSize: AppSizes.font_12,
        );

    textHeader = Theme.of(context!).textTheme.displaySmall!.copyWith(
          fontWeight: FontWeight.w600,
          fontFamily: BaseFonts.SFPro,
          color: AppColors.secondaryColor,
          fontSize: AppSizes.font_16,
        );
    display6W400 = Theme.of(context!).textTheme.displaySmall!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 6,
          color: AppColors.black,
          fontWeight: FontWeight.w400,
        );
    display10W400 = Theme.of(context!).textTheme.displaySmall!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 10,
          color: AppColors.black,
          fontWeight: FontWeight.w400,
        );
    display8W400 = Theme.of(context!).textTheme.displaySmall!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 8,
          color: AppColors.black,
          fontWeight: FontWeight.w400,
        );
    display9W400 = Theme.of(context!).textTheme.displaySmall!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 9,
          color: AppColors.black,
          fontWeight: FontWeight.w400,
        );
    display10W500 = Theme.of(context!).textTheme.displaySmall!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 10,
          color: AppColors.black,
          fontWeight: FontWeight.w500,
        );
    display11W600 = Theme.of(context!).textTheme.displaySmall!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 11,
          color: AppColors.black,
          fontWeight: FontWeight.w600,
        );
    display11W400 = Theme.of(context!).textTheme.displaySmall!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 11,
          color: AppColors.black,
          fontWeight: FontWeight.w400,
        );
    display11W300 = Theme.of(context!).textTheme.displaySmall!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 11,
          color: AppColors.black,
          fontWeight: FontWeight.w300,
        );
    display11W800 = Theme.of(context!).textTheme.displaySmall!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 11,
          color: AppColors.black,
          fontWeight: FontWeight.w800,
        );
    display11W500 = Theme.of(context!).textTheme.displaySmall!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 11,
          color: AppColors.black,
          fontWeight: FontWeight.w500,
        );

    display12W400 = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 12,
          color: AppColors.black,
          fontWeight: FontWeight.w400,
        );
    display12W500 = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 12,
          color: AppColors.black,
          fontWeight: FontWeight.w500,
        );
    display12W600 = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 12,
          color: AppColors.black,
          fontWeight: FontWeight.w600,
        );
    display12W700 = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 12,
          color: AppColors.black,
          fontWeight: FontWeight.w700,
        );
    display12W800 = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 12,
          color: AppColors.black,
          fontWeight: FontWeight.w800,
        );
    display13W400 = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 13,
          color: AppColors.black,
          fontWeight: FontWeight.w400,
        );
    display13W600 = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 13,
          color: AppColors.black,
          fontWeight: FontWeight.w600,
        );
    display13W500 = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 13,
          color: AppColors.black,
          fontWeight: FontWeight.w500,
        );
    display13W700 = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 13,
          color: AppColors.black,
          fontWeight: FontWeight.w700,
        );
    display14W400 = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 14,
          color: AppColors.black,
          fontWeight: FontWeight.w400,
        );
    display14W500 = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontSize: 14,
          color: AppColors.black,
          fontWeight: FontWeight.w500,
          fontFamily: BaseFonts.SFPro,
        );
    display14W300 = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontSize: 14,
          color: AppColors.black,
          fontWeight: FontWeight.w300,
          fontFamily: BaseFonts.SFPro,
        );
    display14W600 = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 14,
          color: AppColors.black,
          fontWeight: FontWeight.w600,
        );
    display14W700 = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 14,
          color: AppColors.black,
          fontWeight: FontWeight.w700,
        );
    display14W800 = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 14,
          color: AppColors.black,
          fontWeight: FontWeight.w800,
        );
    display15W400 = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 15,
          color: AppColors.black,
          fontWeight: FontWeight.w400,
        );
    display15W500 = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 15,
          color: AppColors.black,
          fontWeight: FontWeight.w500,
        );
    display15W600 = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 15,
          color: AppColors.black,
          fontWeight: FontWeight.w600,
        );
    display15W700 = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 15,
          color: AppColors.black,
          fontWeight: FontWeight.w700,
        );
    display16W400 = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 16,
          color: AppColors.black,
          fontWeight: FontWeight.w400,
        );
    display16W300 = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 16,
          color: AppColors.black,
          fontWeight: FontWeight.w300,
        );

    display16W500 = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 16,
          color: AppColors.black,
          fontWeight: FontWeight.w500,
        );
    display16W600 = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 16,
          color: AppColors.black,
          fontWeight: FontWeight.w600,
        );
    display16W700 = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 16,
          color: AppColors.black,
          fontWeight: FontWeight.w600,
        );
    display17W400 = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 17,
          color: AppColors.black,
          fontWeight: FontWeight.w400,
        );
    display17W500 = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 17,
          color: AppColors.black,
          fontWeight: FontWeight.w500,
        );
    display17W600 = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 17,
          color: AppColors.black,
          fontWeight: FontWeight.w600,
        );
    display17W700 = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 17,
          color: AppColors.black,
          fontWeight: FontWeight.w700,
        );
    display18W600 = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 18,
          color: AppColors.black,
          fontWeight: FontWeight.w600,
        );
    display18W500 = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 18,
          color: AppColors.black,
          fontWeight: FontWeight.w500,
        );
    display18W400 = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 18,
          color: AppColors.black,
          fontWeight: FontWeight.w400,
        );
    display18W700 = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 18,
          color: AppColors.black,
          fontWeight: FontWeight.w700,
        );
    display20W400 = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 20,
          color: AppColors.black,
          fontWeight: FontWeight.w400,
        );
    display20W500 = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 20,
          color: AppColors.black,
          fontWeight: FontWeight.w500,
        );
    display20W600 = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 20,
          color: AppColors.black,
          fontWeight: FontWeight.w600,
        );
    display20W700 = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 20,
          color: AppColors.black,
          fontWeight: FontWeight.w700,
        );
    display21W600 = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 21,
          color: AppColors.black,
          fontWeight: FontWeight.w600,
        );
    display22W400 = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 22,
          color: AppColors.black,
          fontWeight: FontWeight.w400,
        );
    display22W600 = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 22,
          color: AppColors.black,
          fontWeight: FontWeight.w600,
        );
    display22W700 = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 22,
          color: AppColors.black,
          fontWeight: FontWeight.w700,
        );

    display24W400 = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 24,
          color: AppColors.black,
          fontWeight: FontWeight.w400,
        );
    display24W500 = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 24,
          color: AppColors.black,
          fontWeight: FontWeight.w500,
        );
    display24W600 = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 24,
          color: AppColors.black,
          fontWeight: FontWeight.w600,
        );
    display24W700 = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 24,
          color: AppColors.black,
          fontWeight: FontWeight.w700,
        );
    display36W700 = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 30,
          color: AppColors.black,
          fontWeight: FontWeight.w700,
        );
    display30W700 = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 30,
          color: AppColors.black,
          fontWeight: FontWeight.w700,
        );
    display32W700 = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 32,
          color: AppColors.black,
          fontWeight: FontWeight.w700,
        );
    display32W600 = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 32,
          color: AppColors.black,
          fontWeight: FontWeight.w600,
        );
    display30W400 = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 30,
          color: AppColors.black,
          fontWeight: FontWeight.w400,
        );
    display32W500 = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 32,
          color: AppColors.black,
          fontWeight: FontWeight.w500,
        );
    display52W500 = Theme.of(context!).textTheme.displayLarge!.copyWith(
          fontFamily: BaseFonts.SFPro,
          fontSize: 52,
          color: AppColors.black,
          fontWeight: FontWeight.w500,
        );
  }
}

class BaseFonts {
  static const String SFPro = "SF-Pro";
}
