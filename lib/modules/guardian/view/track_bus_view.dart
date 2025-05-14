import 'package:flutter_svg/flutter_svg.dart';
import 'package:route_roster_pro/config/theme/app_textstyle.dart';
import 'package:route_roster_pro/utils/utils.dart';

import '../../../../config/theme/app_colors.dart';
import '../../../../generated/assets.dart';
import '../../../../utils/common_import.dart';
import '../../../config/app_sizer.dart';

class TrackBusView extends StatelessWidget {
  TrackBusView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(child: topBar(context)),
        Positioned(left: 0, right: 0, bottom: 16, child: bottomBar(context))
      ],
    );
  }

  Widget topBar(BuildContext context) {
    return Column(
      children: [
        Utils().topBar("Route 66", backIcon: true),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*   Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
              decoration: Utils().commonDecoration(),
              child: Column(
                children: [
                  Text(
                    "SPEED",
                    style: AppTextStyles(context).display12W500,
                  ),
                  Text(
                    "LIMIT",
                    style: AppTextStyles(context).display12W500,
                  ),
                  Text(
                    "20",
                    style: AppTextStyles(context)
                        .display26W500
                        .copyWith(color: AppColors.primaryColor),
                  ),
                  Text(
                    "KM/P",
                    style: AppTextStyles(context)
                        .display10W500
                        .copyWith(color: AppColors.primaryColor),
                  )
                ],
              ),
            ),*/
            InkWell(
              onTap: () {},
              child: Container(
                // margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                decoration: Utils().commonDecoration(color: AppColors.black),
                child: Column(
                  children: [
                    SvgPicture.asset(Assets.svgIcCall).paddingOnly(bottom: 10),
                    Text(
                      "Coordinator",
                      style: AppTextStyles(context)
                          .display12W500
                          .copyWith(color: Colors.white),
                    )
                  ],
                ),
              ),
            )
          ],
        ).paddingSymmetric(horizontal: 12, vertical: 12)
      ],
    );
  }

  Widget bottomBar(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                  color: Utils.parseDouble(data: "0") == 0
                      ? AppColors.color949495
                      : (Utils.parseDouble(data: "0") <= 20)
                          ? AppColors.color05A319
                          : AppColors.colorF3434E,
                  width: 3)),
          child: Column(
            children: [
              Text(
                "0",
                style: AppTextStyles(context)
                    .display16W600
                    .copyWith(color: AppColors.color949495),
              ),
              Text(
                "KM/P",
                style: AppTextStyles(context)
                    .display8W400
                    .copyWith(color: AppColors.color949495),
              ),
            ],
          ),
        ).paddingSymmetric(horizontal: 12, vertical: 12),
        Container(
          width: context.width,
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          decoration: Utils().commonDecoration(),
          child:  swipePage(0, context),
        ).paddingSymmetric(horizontal: 12),
      ],
    );
  }

  Widget swipePage(int number, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 22,
          width: 22,
          padding: const EdgeInsets.all(1),
          decoration:  BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(AppSizes.radius_4)
          ),
          child: Center(
            child: Text(
              "1",
              style: AppTextStyles(context)
                  .display14W500
                  .copyWith(color: AppColors.white),
            ),
          ),
        ).paddingOnly(right: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Next Stop",
                    style: AppTextStyles(context).display14W400,
                  ),
                  Text(
                    "ETA",
                    style: AppTextStyles(context).display14W400,
                  ),
                ],
              ).paddingOnly(bottom: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Uttam Nagar",
                    maxLines: 1,
                    style: AppTextStyles(context)
                        .display20W500
                        .copyWith(color: AppColors.primaryColor),
                  ),
                  Text(
                    "15 Min",
                    style: AppTextStyles(context).display20W500,
                  ),
                ],
              ),

            ],
          ).paddingSymmetric(horizontal: 10),
        ),

      ],
    ).paddingOnly(top: 5);
  }
}
