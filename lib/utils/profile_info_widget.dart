import 'package:flutter_svg/svg.dart';
import 'package:route_roster_pro/utils/utils.dart';

import '../config/app_sizer.dart';
import '../config/theme/app_colors.dart';
import '../config/theme/app_textstyle.dart';
import '../generated/assets.dart';
import 'common_import.dart';

Widget profileInfo(
    {required String header,
    required String name,
    required String role,
    required String address,
    required String phone,
    required String img,
    bool hideLabel = false,
    bool hideAddress = false}) {
  return Builder(builder: (context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 0),
      decoration: Utils().commonDecoration(),
      child: Column(
        children: [
          if (!hideLabel)
            Container(
              width: context.width,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
              decoration: BoxDecoration(
                  color: AppColors.colorF3F3F3,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(AppSizes.radius_10),
                      bottomLeft: Radius.circular(AppSizes.radius_10))),
              child: Text(
                header,
                style: AppTextStyles(context)
                    .display14W600
                    .copyWith(color: AppColors.color949495),
                overflow: TextOverflow.ellipsis,
              ),
            ).paddingOnly(bottom: 11, left: 9, right: 9)
          else
            const SizedBox(
              height: 11,
            ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primaryColor),
                    shape: BoxShape.circle),
                child: Image.network(
                  img,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return SvgPicture.asset(Assets.svgGirlIcon);
                  },
                ),
              ).paddingOnly(right: 10),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: AppTextStyles(context).display18W600,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(role,
                      style: AppTextStyles(context)
                          .display14W500
                          .copyWith(color: AppColors.color949495))
                ],
              )),
            ],
          ).paddingOnly(bottom: 16, left: 9, right: 9),
          if (!hideAddress) ...[
            Utils().dottedLine().paddingOnly(bottom: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  Assets.svgHomeIcon,
                  width: 20,
                  height: 20,
                ).paddingOnly(right: 10),
                Expanded(
                  child: Text(
                    address,
                    style: AppTextStyles(context).display14W500,
                    maxLines: 3,
                  ),
                )
              ],
            ).paddingOnly(bottom: 10, left: 20, right: 20),
          ],
          Utils().dottedLine().paddingOnly(bottom: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                Assets.svgPhoneIcon,
                width: 20,
                height: 20,
              ).paddingOnly(right: 10),
              Expanded(
                child: Text(
                  phone,
                  style: AppTextStyles(context).display14W500,
                  maxLines: 3,
                ),
              )
            ],
          ).paddingOnly(bottom: 16, left: 20, right: 20),
        ],
      ),
    ).paddingSymmetric(horizontal: 12);
  });
}
