import 'package:flutter_svg/flutter_svg.dart';

import '../../../../config/theme/app_colors.dart';
import '../../../../config/theme/app_textstyle.dart';
import '../../../../generated/assets.dart';
import '../../../../utils/common_import.dart';
import '../../../../utils/enums.dart';
import '../../../../utils/utils.dart';
import '../../../driver/track_screen/widgets/widgets.dart';

Widget routeWidget(
    {required String routeName,
    required String label,
    required String time,
    required String stopList,
    required String students,
    required String staffCount,
    required bool applyBgColor,
      VoidCallback? onTapContainer,
      VoidCallback? onTapStudent,
      VoidCallback? onTapStop,
      VoidCallback? onTapStaff,
    required TripType tripType}) {
  return Builder(builder: (context) {
    return InkWell(
      onTap: (){
        if(onTapContainer!=null) onTapContainer();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 9),
        margin: const EdgeInsets.symmetric(horizontal: 11, vertical: 10),
        decoration: Utils().commonDecoration(
            color: applyBgColor
                ? tripType == TripType.completed
                    ? AppColors.colorF1F1F1
                    : null
                : null),
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(Assets.svgBusIcon).paddingOnly(right: 6),
                Expanded(
                  child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: 'Route ',
                      style: AppTextStyles(context)
                          .display16W500
                          .copyWith(color: AppColors.color949495),
                      children: [
                        TextSpan(
                          text: routeName,
                          style: AppTextStyles(context).display16W600.copyWith(color:  tripType == TripType.completed
                              ? AppColors.color949495
                              : null),
                        ),
                      ],
                    ),
                  ),
                ),

                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: '$label\n',
                    style: AppTextStyles(context).display11W500,
                    children: [
                      TextSpan(
                        text: time,
                        style: AppTextStyles(context).display18W600.copyWith(
                            color: tripType == TripType.completed
                                ? AppColors.color949495
                                : AppColors.primaryColor),
                      ),
                    ],
                  ),
                )
              ],
            ).paddingOnly(bottom: 10, left: 10, right: 10),
            Utils().dottedLine().paddingOnly(bottom: 10),
            Row(
              children: [
                peopleColumn(
                    stopList,
                    "Stop List",
                    callback: onTapStop,
                    tripType == TripType.completed
                        ? AppColors.color949495
                        : AppColors.primaryColor),
                Utils().verticalDottedLine(),
                peopleColumn(
                    students,
                    "Students",
                    callback: onTapStudent,
                    tripType == TripType.completed
                        ? AppColors.color949495
                        : AppColors.primaryColor),
                Utils().verticalDottedLine(),
                peopleColumn(
                    staffCount,
                    "Staff",
                    callback: onTapStaff,
                    tripType == TripType.completed
                        ? AppColors.color949495
                        : AppColors.primaryColor),
              ],
            )
          ],
        ),
      ),
    );
  });
}
