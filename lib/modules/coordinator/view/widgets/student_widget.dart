import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:route_roster_pro/modules/coordinator/controller/students_controller.dart';
import 'package:route_roster_pro/modules/coordinator/view/widgets/route_info.dart';
import 'package:route_roster_pro/modules/guardian/model/bus_status_model.dart';
import 'package:route_roster_pro/modules/guardian/model/stop_model.dart';

import '../../../../config/theme/app_colors.dart';
import '../../../../config/theme/app_textstyle.dart';
import '../../../../generated/assets.dart';
import '../../../../utils/utils.dart';

class StudentWidget extends StatelessWidget {
  final controller = Get.isRegistered<StudentsController>()
      ? Get.find<StudentsController>()
      : Get.put(StudentsController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        routeInfo(
                routeName: "12",
                label: "Students",
                time: "7:30",
                date: "22 May 2025")
            .paddingOnly(bottom: 14),
        Flexible(
          child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              Stop data = controller.stops[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: 'Stop\n',
                      style: AppTextStyles(context)
                          .display10W500
                          .copyWith(color: AppColors.color949495),
                      children: [
                        TextSpan(
                          text: data.name,
                          style: AppTextStyles(context)
                              .display16W600
                              .copyWith(color: AppColors.primaryColor),
                        ),
                      ],
                    ),
                  ).paddingOnly(bottom: 8),
                  ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: data.students?.length ?? 0,
                      itemBuilder: (context, index) =>
                          data.students?[index] != null
                              ? studentData(data.students?[index])
                              : Container(
                                  decoration: Utils().commonDecoration(),
                                  child: Text("No Pickup/Drop-Off Today")))
                ],
              );
            },
            itemCount: controller.stops.length,
          ).paddingOnly(left: 12, right: 12),
        )
      ],
    );
  }

  Widget studentData(StudentBusStatus? data) {
    return Builder(builder: (context) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 11),
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
                  child: SvgPicture.asset(Assets.svgGirlIcon),
                ).paddingOnly(right: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data?.name ?? "",
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
                                  text: data?.admissionNo,
                                  style: AppTextStyles(context).display12W600,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 9),
                            decoration: Utils().commonDecoration(
                                shadow: false, color: AppColors.colorF3F3F3),
                            child: Text(
                              data?.grade ?? "",
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
                    Text(
                      "South Ex Flyover, Near Arena ",
                      style: AppTextStyles(context).display14W500,
                    )
                  ],
                )),
              ],
            ).paddingOnly(left: 9, right: 9),
          ],
        ),
      ).paddingOnly(bottom: 16);
    });
  }
}
