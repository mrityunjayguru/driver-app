import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:route_roster_pro/config/theme/app_textstyle.dart';

import '../../../config/app_sizer.dart';
import '../../../config/theme/app_colors.dart';
import '../../../generated/assets.dart';
import '../../../utils/enums.dart';
import '../controller/bottom_bar_controller.dart';

class BottomBarView extends StatelessWidget {
  BottomBarView({super.key});

  final BottomBarController controller = Get.put(BottomBarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () {
          final int currentIndex = controller.selectedIndex.value;

          return Column(
            children: [
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (Widget child, Animation<double> animation) {
                    // Determine direction based on index comparison
                    final Offset beginOffset =
                        (controller.previousIndex.value > currentIndex)
                            ? const Offset(-1, 0) // Slide in from the left
                            : const Offset(1, 0); // Slide in from the right
                
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: beginOffset,
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    );
                  },
                  child: KeyedSubtree(
                    // Assign a unique key for each screen
                    key: ValueKey<int>(currentIndex),
                    child: controller.loginType.value == LoginType.guardian.name
                        ? controller.screens[currentIndex]
                        : controller.screensCoordinator[currentIndex],
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Obx(
                    () => Transform.translate(
                      offset: Offset(0, 0.4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                              child: controller.selectedIndex.value == 0
                                  ? SvgPicture.asset(Assets.svgNotchBottomBar)
                                  : SizedBox.shrink()),
                          Expanded(
                              child: controller.selectedIndex.value == 1
                                  ? SvgPicture.asset(Assets.svgNotchBottomBar)
                                  : SizedBox.shrink()),
                          Expanded(
                              child: controller.selectedIndex.value == 2
                                  ? SvgPicture.asset(Assets.svgNotchBottomBar)
                                  : SizedBox.shrink())
                        ],
                      ),
                    ),
                  ),
                  Obx(
                    () => Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(AppSizes.radius_10),
                          color: AppColors.black),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          if (controller.loginType.value ==
                              LoginType.guardian.name) ...[
                            profileTab(context, controller.selectedIndex.value == 0, 0),
                            busStatusTab(context, controller.selectedIndex.value == 1, 1, true)
                          ] else ...[
                            busStatusTab(context, controller.selectedIndex.value == 0, 0, false),
                            profileTab(context, controller.selectedIndex.value == 1, 1)
                          ],
                          bottomTabs(
                            context: context,
                            img: Assets.svgSettingsIcon,
                            title: "Settings",
                            isSelected:
                            controller.selectedIndex.value == 2,
                            onTap: () => controller.updateIndex(2),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ).paddingOnly(bottom: 16, left: 13, right: 13)
            ],
          );
        },
      ),
    );
  }

  Widget profileTab(BuildContext context, bool isSelected, int index) {
    return bottomTabs(
      context: context,
      img: Assets.svgProfileIcon,
      title: "Profile",
      isSelected: isSelected,
      onTap: () => controller.updateIndex(index),
    );
  }

  Widget busStatusTab(BuildContext context, bool isSelected, int index, bool busStatus) {
    return bottomTabs(
      context: context,
      img: busStatus ? Assets.svgBusStatusIcon : Assets.svgRouteInfoIcon,
      title: busStatus ? "Bus Status" : "Route Info",
      isSelected: isSelected,
      onTap: () => controller.updateIndex(index),
    );
  }

  Widget bottomTabs({
    required BuildContext context,
    required String img,
    required bool isSelected,
    required String title,
    required VoidCallback onTap, // Add onTap callback
  }) {
    return Expanded(
      child: Transform.translate(
        offset: isSelected ? Offset(0, -16) : Offset(0, 0),
        child: GestureDetector(
          // Wrap with GestureDetector for tap detection
          onTap: onTap,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                img,
                width: isSelected ? 30 : 26,
                height: isSelected ? 30 : 26,
              ),
              if (isSelected)
                Transform.translate(
                    offset: Offset(0, 24),
                    child: Text(
                      title,
                      style: AppTextStyles(context)
                          .display12W500
                          .copyWith(color: AppColors.white),
                    ).paddingOnly(top: 5))
            ],
          ).paddingSymmetric(vertical: 12),
        ),
      ),
    );
  }
}
