import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:route_roster_pro/modules/coordinator/view/widgets/route_info.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../../config/theme/app_colors.dart';
import '../../../../config/theme/app_textstyle.dart';
import '../../../../generated/assets.dart';
import '../../../../utils/utils.dart';
import '../../../guardian/model/stop_model.dart';

class HistoryTimeline extends StatelessWidget {

  const HistoryTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        routeInfo(
            routeName: "12", label: "Stops", time: "7:30", date: "22 May 2025"),
        Flexible(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {


              return TimelineTile(
                alignment: TimelineAlign.start,
                isFirst: false,
                isLast: index==9,
                beforeLineStyle: const LineStyle(
                    color: AppColors.primaryColor, thickness: 2),
                afterLineStyle: const LineStyle(
                    color: AppColors.primaryColor, thickness: 2),
                indicatorStyle: IndicatorStyle(
                    width: 30,
                    height: 30,
                    indicator: Stack(
                      children: [
                        SvgPicture.asset(Assets.svgHistoryBgIcon),
                        Center(
                            child: Text(
                          "${index + 1}",
                          style: AppTextStyles(context)
                              .display14W600
                              .copyWith(color: AppColors.primaryColor),
                        )),
                      ],
                    )),
                endChild: Container(
                    width: context.width,
                    // height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 10),
                    decoration: Utils().commonDecoration(
                        color: AppColors.colorF3F3F3, shadow: false),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Stop",
                                style: AppTextStyles(context)
                                    .display11W500
                                    .copyWith(color: AppColors.color1E1E1E),
                              ),
                              Text(
                                "Defence Colony",
                                style: AppTextStyles(context)
                                    .display16W600
                                    .copyWith(color: AppColors.primaryColor),
                              ),
                            ],
                          ).paddingOnly(right: 2).paddingSymmetric(vertical: 6),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "ETA",
                                style: AppTextStyles(context)
                                    .display11W500
                                    .copyWith(color: AppColors.color1E1E1E),
                              ),
                              Text(
                                "7:30",
                                style: AppTextStyles(context)
                                    .display18W600
                                    .copyWith(color: AppColors.primaryColor),
                              ),
                            ],
                          ).paddingSymmetric(vertical: 6),
                        ),
                      ],
                    )),
              ).paddingOnly(left: 12 + 6, right: 0);
            },
          ),
        ),
      ],
    );
  }
}
