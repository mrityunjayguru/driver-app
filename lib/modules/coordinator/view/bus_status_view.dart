import 'dart:io';
import 'dart:math';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:route_roster_pro/config/app_sizer.dart';
import 'package:route_roster_pro/config/theme/app_textstyle.dart';
import 'package:route_roster_pro/generated/assets.dart';
import 'package:route_roster_pro/modules/guardian/model/bus_status_model.dart';
import 'package:route_roster_pro/modules/guardian/view/track_bus_view.dart';
import 'package:route_roster_pro/utils/utils.dart';

import '../../../../config/theme/app_colors.dart';
import '../../../../utils/common_import.dart';
import '../../../../utils/enums.dart';
import '../controller/bus_status_controller.dart';

class CoordinatorBusStatusView extends StatefulWidget {
  CoordinatorBusStatusView({super.key});

  @override
  State<CoordinatorBusStatusView> createState() =>
      _CoordinatorBusStatusViewState();
}

class _CoordinatorBusStatusViewState extends State<CoordinatorBusStatusView> {
  final CoordinatorBusStatusController controller =
      Get.put(CoordinatorBusStatusController());

  final PageController pageController = PageController();

  @override
  void initState() {
    controller.tab.value = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6),
                color: AppColors.colorFEF1D6,
                height: Platform.isAndroid
                    ? MediaQuery.of(context).size.height * 0.15
                    : MediaQuery.of(context).size.height * 0.175,
                width: double.infinity,
                child: Obx(
                  () => Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      children: [
                        tab(controller.tab.value == 0, "Stops", 0),
                        tab(controller.tab.value == 1, "Students", 1),
                        tab(controller.tab.value == 2, "Coordinators", 2),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(color: Colors.white),
              ),
            ],
          ),
          SafeArea(
            child: Column(
              children: [
                Obx(
                  () => Column(
                    children: [
                      Utils().topBar("Route 12", onTap: () {
                        controller.openDropdown.value =
                            !controller.openDropdown.value;
                      },
                          rotation: controller.openDropdown.value
                              ? -(270 * (pi / 180))
                              : 270 * (pi / 180),
                          backIcon: false,
                          rightIcon: Assets.svgIcBack),
                      if (controller.openDropdown.value)
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 12),
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          constraints: BoxConstraints(maxHeight: 200),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(AppSizes.radius_4),
                              bottomRight: Radius.circular(AppSizes.radius_4),
                            ),
                            boxShadow: [
                              // Bottom shadow
                              BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                offset: Offset(0, 3),
                                blurRadius: 6,
                                spreadRadius: 0,
                              ),
                              // Left shadow
                              BoxShadow(
                                color: Colors.black.withOpacity(0.07),
                                offset: Offset(-2, 1),
                                blurRadius: 4,
                                spreadRadius: 0,
                              ),
                              // Right shadow
                              BoxShadow(
                                color: Colors.black.withOpacity(0.07),
                                offset: Offset(2, 1),
                                blurRadius: 4,
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: ListView.separated(
                              itemBuilder: (context, index) => InkWell(
                                onTap: (){
                                  controller.openDropdown.value=false;
                                },
                                child: Container(
                                  child: Text(
                                        "Route 12",
                                        style: AppTextStyles(context)
                                            .display20W500
                                            .copyWith(
                                                color: AppColors.primaryColor),
                                      ).paddingAll(7),
                                ),
                              ),
                              separatorBuilder: (context, index) =>
                                  Utils().dottedLine(),
                              itemCount: 10),
                        )
                    ],
                  ).paddingOnly(
                      bottom: controller.openDropdown.value ? 20 : 50),
                ),
                Expanded(
                  child: PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      controller.tab.value = index;
                    },
                    children: controller.screens,
                  ),
                ),
              ],
            ).paddingOnly(bottom: 12),
          ),
        ],
      ),
    );
  }

  Widget listItem(BuildContext context, int index) {
    StudentBusStatus data = controller.studentBusStatusList[index];
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 20),
        decoration: Utils().commonDecoration(),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primaryColor),
                      shape: BoxShape.circle),
                  child: Image.network(
                    "",
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return SvgPicture.asset(
                          data.gender ? Assets.svgGirlIcon : Assets.svgBoyIcon);
                    },
                  ),
                ).paddingOnly(right: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.name,
                        style: AppTextStyles(context).display18W600,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'Adm. No.: ',
                              style: AppTextStyles(context)
                                  .display12W500
                                  .copyWith(color: AppColors.color949495),
                              children: [
                                TextSpan(
                                  text: data.admissionNo,
                                  style: AppTextStyles(context).display12W600,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 9),
                            decoration: Utils().commonDecoration(
                                shadow: false, color: AppColors.colorF3F3F3),
                            child: Text(
                              data.grade,
                              style: AppTextStyles(context).display12W500,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ).paddingOnly(bottom: 10, left: 9, right: 9),
            Utils().dottedLine().paddingOnly(bottom: 10),
            Row(
              children: [
                Expanded(
                    child: Row(
                  children: [
                    SvgPicture.asset(
                      Assets.svgBusIcon,
                      width: 20,
                      height: 20,
                    ).paddingOnly(right: 10),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Route ',
                        style: AppTextStyles(context).display16W500,
                        children: [
                          TextSpan(
                            text: data.routeNo.toString(),
                            style: AppTextStyles(context).display16W600,
                          ),
                        ],
                      ),
                    )
                  ],
                )),
                Expanded(
                    child: Row(
                  children: [
                    SvgPicture.asset(
                      Assets.svgBusStopIcon,
                      width: 20,
                      height: 20,
                    ).paddingOnly(right: 10),
                    Text(
                      data.pickupPoint,
                      style: AppTextStyles(context).display14W500,
                    )
                  ],
                ))
              ],
            ).paddingOnly(left: 9, right: 9),
            Utils().dottedLine().paddingSymmetric(vertical: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      if (data.busStatus == BusStatus.transit.value) {
                        Utils().navigate(TrackBusView());
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(9),
                      decoration: Utils().commonDecoration(
                          color: data.busStatus == BusStatus.transit.value
                              ? AppColors.primaryColor
                              : AppColors.colorC4C4C4,
                          shadow: false),
                      child: Column(
                        children: [
                          Text(
                            "Bus Status",
                            style: AppTextStyles(context)
                                .display16W600
                                .copyWith(color: AppColors.white),
                          ),
                          Text(
                            data.busStatus,
                            style: AppTextStyles(context)
                                .display14W500
                                .copyWith(color: AppColors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pickup",
                            style: AppTextStyles(context)
                                .display11W500
                                .copyWith(color: AppColors.color1E1E1E),
                          ),
                          Text(
                            data.pickupTime,
                            style: AppTextStyles(context)
                                .display18W600
                                .copyWith(color: AppColors.primaryColor),
                          ),
                        ],
                      ),
                      SvgPicture.asset(Assets.svgArrow)
                          .paddingSymmetric(horizontal: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Drop-off",
                            style: AppTextStyles(context)
                                .display11W500
                                .copyWith(color: AppColors.color1E1E1E),
                          ),
                          Text(
                            data.dropTime,
                            style: AppTextStyles(context)
                                .display18W600
                                .copyWith(color: AppColors.primaryColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ).paddingOnly(left: 9, right: 9),
          ],
        ),
      ).paddingOnly(bottom: 16),
    );
  }

  Widget tab(bool selected, String name, int index) {
    return Expanded(
      child: Builder(builder: (context) {
        return InkWell(
          onTap: () {
            controller.tab.value = index;
            pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 6),
            padding: const EdgeInsets.symmetric(vertical: 3),
            decoration: BoxDecoration(
                color: !selected ? AppColors.primaryColor : AppColors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppSizes.radius_4),
                    topRight: Radius.circular(AppSizes.radius_4))),
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: AppTextStyles(context).display14W600.copyWith(
                    color: selected ? AppColors.primaryColor : AppColors.white,
                  ),
            ),
          ),
        );
      }),
    );
  }
}
