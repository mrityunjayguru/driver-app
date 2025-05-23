import 'dart:io';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:route_roster_pro/config/app_sizer.dart';
import 'package:route_roster_pro/config/theme/app_textstyle.dart';
import 'package:route_roster_pro/generated/assets.dart';
import 'package:route_roster_pro/modules/guardian/model/bus_status_model.dart';
import 'package:route_roster_pro/utils/utils.dart';

import '../../../../config/theme/app_colors.dart';
import '../../../../utils/common_import.dart';
import '../../../utils/profile_info_widget.dart';
import '../controller/profile_controller.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  final ProfileController controller = Get.put(ProfileController());

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
                height: Platform.isAndroid ? MediaQuery.of(context).size.height * 0.29 :  MediaQuery.of(context).size.height * 0.315,
                width: double.infinity,
              ),
              Expanded(
                child: Container(color: Colors.white),
              ),
            ],
          ),
          SafeArea(
            child: Column(
              children: [
                Utils().topBar("Profile",
                    backIcon: false, rightIcon: Assets.svgActiveBellIcon),
                profileInfo(
                        header: "Guardian's Profile",
                        name: 'Eliana Keller',
                        role: 'Mother',
                        address: '1245 Maple Grove Lane Brookfield,Gurugram, Haryana',
                        phone: '+91 98765 43210',
                        img: '')
                    .paddingOnly(
                        top: MediaQuery.of(context).size.height * 0.05),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => listItem(context, index),
                    itemCount: controller.studentBusStatusList.length,
                  ).paddingSymmetric(horizontal: 12, vertical: 10),
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 0),
      decoration: Utils().commonDecoration(),
      child: Column(
        children: [
          Container(
            width: context.width,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
            decoration: BoxDecoration(
                color: AppColors.colorF3F3F3,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(AppSizes.radius_10),
                    bottomLeft: Radius.circular(AppSizes.radius_10))),
            child: Row(
              children: [
                SvgPicture.asset(Assets.svgSchoolIcon).paddingOnly(right: 6),
                Expanded(
                  child: Text(
                    data.schoolName,
                    style: AppTextStyles(context)
                        .display14W600
                        .copyWith(color: AppColors.color949495),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ).paddingOnly(bottom: 11, left: 9, right: 9),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primaryColor),
                    shape: BoxShape.circle),
                child: SvgPicture.asset(
                    data.gender ? Assets.svgGirlIcon : Assets.svgBoyIcon),
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
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 9),
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
                    if (!data.cancelled) {}
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 9, vertical: 14),
                    decoration: Utils().commonDecoration(
                        color: !data.cancelled
                            ? AppColors.primaryColor
                            : AppColors.colorC4C4C4,
                        shadow: false),
                    child: Center(
                      child: Text(
                        data.cancelled ? "Cancel Pickup" : "Cancelled Pickup",
                        style: AppTextStyles(context)
                            .display16W600
                            .copyWith(color: AppColors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: data.cancelled
                    ? RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          text: '15 May 2025\n',
                          style: AppTextStyles(context).display14W600,
                          children: [
                            TextSpan(
                              text:
                                  "Cancel editable until 30 minutes before pickup/drop.",
                              style: AppTextStyles(context)
                                  .display10W500
                                  .copyWith(color: AppColors.color949495),
                            ),
                          ],
                        ),
                      ).paddingOnly(left: 16)
                    : Row(
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
          ).paddingOnly(left: 9, right: 9, bottom: 20),
        ],
      ),
    ).paddingOnly(bottom: 16);
  }
}
