import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../config/app_sizer.dart';
import '../../../config/theme/app_colors.dart';
import '../../../config/theme/app_textstyle.dart';
import '../../../generated/assets.dart';
import '../../../utils/utils.dart';
import '../model/stop_model.dart';

class StopTimeline extends StatelessWidget {
  final List<Stop> stops;

  const StopTimeline({super.key, required this.stops});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: stops.length,
      itemBuilder: (context, index) {
        final stop = stops[index];
        final isLast = index == stops.length - 1;

        return TimelineTile(
          alignment: TimelineAlign.manual,
          lineXY: 0.13,
          isFirst: false,
          isLast: isLast,
          beforeLineStyle: const LineStyle(color: AppColors.primaryColor, thickness: 2),
          afterLineStyle: const LineStyle(color: AppColors.primaryColor, thickness: 2),
          // Add date text beside the indicator
          startChild: Container(
            height: 70,
            margin: EdgeInsets.only(left: 12),
            child: Center(
              child: RichText(
                textAlign: TextAlign.end,
                text: TextSpan(
                  text: '15\n',
                  style: AppTextStyles(context)
                      .display16W600,
                  children: [
                    TextSpan(
                      text: "May", ///show 3 letter name for the month to avoid spacing issues
                      style: AppTextStyles(context).display10W600,
                    ),
                  ],
                ),
              ),
            ),
          ),

          indicatorStyle: IndicatorStyle(
            width: 30,
            height: 30,
            indicator: stop.holiday
                ? Stack(
                    children: [
                      SvgPicture.asset(Assets.svgHistoryBgIcon),
                      Center(child: SvgPicture.asset(Assets.svgCrossIcon)),
                    ],
                  )
                : (stop.canceledPickup || stop.canceledDropOff)
                    ? SvgPicture.asset(Assets.svgPickupIcon)
                    : SvgPicture.asset(Assets.svgHistIcon),
          ),

          endChild: Container(
              width: context.width,
              // height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: Utils().commonDecoration(
                  color: AppColors.colorF3F3F3, shadow: false),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if(stop.holiday)Center(
                    child: Text("Holiday", style : AppTextStyles(context)
                                        .display18W600),
                  ) else ...[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pickup",
                            style: AppTextStyles(context)
                                .display11W500
                                .copyWith(color: AppColors.color1E1E1E),
                          ),
                          Text(
                            stop.time,
                            style: AppTextStyles(context)
                                .display18W600
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
                            "Drop-off",
                            style: AppTextStyles(context)
                                .display11W500
                                .copyWith(color: AppColors.color1E1E1E),
                          ),
                          Text(
                            stop.time,
                            style: AppTextStyles(context)
                                .display18W600
                                .copyWith(color: AppColors.primaryColor),
                          ),
                        ],
                      ).paddingSymmetric(vertical: 6),
                    ),
                  ],
                  if(!stop.holiday)Expanded(
                      flex: 2,
                      child: (stop.canceledPickup || stop.canceledDropOff) ?IntrinsicHeight(
                        child: Container(
                          width: context.width,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 11, vertical: 5),
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.only(
                                  bottomRight:
                                      Radius.circular(AppSizes.radius_4),
                                  bottomLeft: Radius.circular(
                                      AppSizes.radius_4))),
                          child: Center(
                            child: Text(
                              "Pickup Canceled",
                              style: AppTextStyles(context)
                                  .display12W400
                                  .copyWith(color: AppColors.white),
                              overflow: TextOverflow.ellipsis,
                            ).paddingOnly(bottom: 3),
                          ),
                        ),
                      ) : const SizedBox())
                ],
              )),
        );
      },
    );
  }
}
