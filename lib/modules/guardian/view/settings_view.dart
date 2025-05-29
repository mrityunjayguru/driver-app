import 'dart:io';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:route_roster_pro/config/app_sizer.dart';
import 'package:route_roster_pro/config/theme/app_textstyle.dart';
import 'package:route_roster_pro/generated/assets.dart';
import 'package:route_roster_pro/modules/guardian/model/bus_status_model.dart';
import 'package:route_roster_pro/modules/guardian/view/history_view.dart';
import 'package:route_roster_pro/utils/utils.dart';

import '../../../../config/theme/app_colors.dart';
import '../../../../utils/common_import.dart';
import '../controller/profile_controller.dart';

class SettingsView extends StatelessWidget {
  SettingsView({super.key});

  final WidgetStateProperty<Icon?> thumbIcon =
      WidgetStateProperty.resolveWith<Icon?>(
    (Set<WidgetState> states) {
      return const Icon(Icons.close, color: Colors.transparent);
    },
  );
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
                height: Platform.isAndroid ? MediaQuery.of(context).size.height * 0.15 :  MediaQuery.of(context).size.height * 0.175,
                width: double.infinity,
              ),
              Expanded(
                child: Container(color: Colors.white),
              ),
            ],
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Utils().topBar("Settings",
                    backIcon: false, rightIcon: Assets.svgActiveBellIcon),
                Text(
                  "Crafted by DesignDemonz",
                  style: AppTextStyles(context)
                      .display10W400
                      .copyWith(color: AppColors.color4B4749),
                ).paddingOnly(top: 10, left: 18),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                          shape: BoxShape.circle),
                      child: SvgPicture.asset(Assets.svgNotificationIcon),
                    ).paddingOnly(right: 10),
                    Expanded(
                        child: Text(
                      "Notifications",
                      style: AppTextStyles(context).display20W500,
                      overflow: TextOverflow.ellipsis,
                    )),
                    Switch(
                      thumbIcon: thumbIcon,
                      trackOutlineWidth: const WidgetStatePropertyAll(0),
                      trackOutlineColor:
                          const WidgetStatePropertyAll(Colors.transparent),
                      activeColor: AppColors.primaryColor,
                      value: true,
                      inactiveThumbColor: AppColors.primaryColor,
                      inactiveTrackColor: AppColors.colorF3F3F3,
                      activeTrackColor: AppColors.colorFEF1D6,
                      onChanged: (value) {},
                    )
                  ],
                ).paddingOnly(bottom: 16, left: 9 + 12, right: 9 + 12, top: 20),
                Flexible(
                  child: Container(
                    // padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 0),
                    decoration:
                        Utils().commonDecoration(color: AppColors.colorF2F2F2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                            width: context.width,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 11, vertical: 17),
                            decoration: Utils().commonDecoration(
                                color: AppColors.primaryColor, shadow: false),
                            child: Center(
                              child: Text(
                                "PickUp/Drop-Off History",
                                style: AppTextStyles(context)
                                    .display20W500
                                    .copyWith(color: AppColors.white),
                                overflow: TextOverflow.ellipsis,
                              ),
                            )),
                        Text(
                          "Select Child",
                          style: AppTextStyles(context)
                              .display14W500
                              .copyWith(color: AppColors.color949495),
                          overflow: TextOverflow.ellipsis,
                        ).paddingOnly(top: 10, bottom: 12, left: 18),
                        Flexible(
                          child: ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) =>
                                listItem(context, index),
                            itemCount: controller.studentBusStatusList.length+20,
                            separatorBuilder: (BuildContext context, int index) =>
                                Utils()
                                    .dottedLine()
                                    .paddingOnly(bottom: 16, left: 12, right: 12),
                          ),
                        ),
                      ],
                    ),
                  ).paddingSymmetric(horizontal: 12, vertical: 10),
                ),
                InkWell(
                  onTap: (){
                    Utils().logout();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 17, horizontal: 54),
                    decoration: Utils().commonDecoration(color: AppColors.black, shadow: false),
                    child: Text("Logout", style: AppTextStyles(context).display20W500.copyWith(color: Colors.white),),
                  ).paddingOnly(bottom: 20, top: 20),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget listItem(BuildContext context, int index) {
    StudentBusStatus data = controller.studentBusStatusList[0];
    return InkWell(
      onTap: (){
        Utils().navigate(HistoryView());
      },
      child: Column(
        children: [
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
                  ],
                ),
              ),
            ],
          ).paddingOnly(left: 18, right: 18),
        ],
      ).paddingOnly(bottom: 16),
    );
  }
}
