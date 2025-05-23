import 'package:flutter_svg/svg.dart';

import '../../../../config/app_sizer.dart';
import '../../../../config/theme/app_colors.dart';
import '../../../../config/theme/app_textstyle.dart';
import '../../../../generated/assets.dart';
import '../../../../utils/common_import.dart';
import '../../../../utils/utils.dart';

Widget routeInfo({
  required String routeName,
  required String label,
  required String time,
  required String date,
}){
  return    Builder(
    builder: (context) {
      return Row(
        children: [
          Container(
              padding: const EdgeInsets.all(9),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(AppSizes.radius_50),
              ),
              child: SvgPicture.asset(Assets.svgTimelineIcon))
              .paddingOnly(left: 12, right: 12),
          RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              text: 'Route $routeName\n',
              style: AppTextStyles(context).display20W500,
              children: [
                TextSpan(
                  text: label,
                  style: AppTextStyles(context).display14W500,
                ),
              ],
            ),
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                  padding:
                  const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                  decoration: Utils().commonDecoration(
                      color: AppColors.colorF3F3F3, shadow: false),
                  child: Text(
                    date,
                    style: AppTextStyles(context).display12W400,
                  )),
              Text(
                time,
                style: AppTextStyles(context).display14W500.copyWith(color: AppColors.primaryColor),
              )
            ],
          ).paddingOnly(left: 12, right: 12)
        ],
      );
    }
  );
}