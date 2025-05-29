import 'dart:io';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:route_roster_pro/config/app_sizer.dart';
import 'package:route_roster_pro/config/theme/app_textstyle.dart';
import 'package:route_roster_pro/generated/assets.dart';
import 'package:route_roster_pro/modules/guardian/controller/bus_status_controller.dart';
import 'package:route_roster_pro/modules/guardian/model/bus_status_model.dart';
import 'package:route_roster_pro/modules/guardian/view/track_bus_view.dart';
import 'package:route_roster_pro/utils/utils.dart';

import '../../../../config/theme/app_colors.dart';
import '../../../../utils/common_import.dart';
import '../../../../utils/enums.dart';

class BusStatusView extends StatelessWidget {
  BusStatusView({super.key});

  final BusStatusController controller = Get.put(BusStatusController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                color: AppColors.colorFEF1D6,
                height: Platform.isAndroid ? MediaQuery.of(context).size.height * 0.35 :  MediaQuery.of(context).size.height * 0.375,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(AppSizes.radius_10),
                      bottomLeft: Radius.circular(AppSizes.radius_10)),
                  child: Image.network(
                    "",
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                          color: AppColors.colorC4E6E9,
                          child: Image.asset(Assets.pngSchoolIcon));
                    },
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
                Utils().topBar("Bus Status",
                    backIcon: false, rightIcon: Assets.svgBellIcon),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => listItem(context, index),
                    itemCount: controller.studentBusStatusList.length,
                  ).paddingSymmetric(horizontal: 12).paddingOnly(
                      top: MediaQuery.of(context).size.height * 0.22),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget listItem(BuildContext context, int index) {
    StudentBusStatus data = controller.studentBusStatusList[index];
    return InkWell(
      onTap: () {

      },
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
                      return SvgPicture.asset(data.gender
                          ? Assets.svgGirlIcon
                          : Assets.svgBoyIcon);
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
                      margin: const EdgeInsets.only(right: 10),
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
            ).paddingOnly( left: 9, right: 9),
          ],
        ),
      ).paddingOnly(bottom: 16),
    );
  }
}
