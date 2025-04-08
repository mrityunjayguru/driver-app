

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../config/theme/app_colors.dart';
import '../../../generated/assets.dart';
import '../../track_screen/view/map_view.dart';
import '../controller/splash_controller.dart';


class SplashView extends StatelessWidget {
  SplashView({super.key});
  final controller = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Center(
        child: InkWell(
          onTap: () {
            Get.to(()=> MapView(), transition: Transition.upToDown, duration: const Duration(milliseconds: 300));
            // Get.toNamed(Routes.LOGIN);
          },
          child: SvgPicture.asset(Assets.svgLogo),
        ),
      ),
    );
  }
}
