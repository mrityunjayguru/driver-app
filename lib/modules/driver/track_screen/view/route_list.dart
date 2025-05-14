import 'package:route_roster_pro/config/theme/app_textstyle.dart';
import 'package:route_roster_pro/modules/driver/track_screen/view/route_data_view.dart';
import 'package:route_roster_pro/utils/utils.dart';

import '../../../../config/theme/app_colors.dart';
import '../../../../utils/common_import.dart';
import '../../../../utils/enums.dart';
import '../controller/track_controller.dart';
import '../widgets/widgets.dart';

class RouteListView extends StatelessWidget {
  RouteListView({super.key});

  final controller = Get.isRegistered<TrackController>()
      ? Get.find<TrackController>() // Find if already registered
      : Get.put(TrackController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorF3F3F3,
      body: SafeArea(
        child: Column(
          children: [
            Utils().topBar("Today's Route Schedule", textRight: "4"),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) => listItem(context, index),
                itemCount: controller.routeList.length,
              ).paddingSymmetric(horizontal: 12).paddingOnly(top: 18),
            )
          ],
        ),
      ),
    );
  }

  Widget listItem(BuildContext context, int index) {
    RouteData data = controller.routeList[index];
    return InkWell(
      onTap: () {
        Get.to(() => RouteDataView(data : data),
            transition: Transition.upToDown,
            duration: const Duration(milliseconds: 300));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 9),
        decoration: Utils().commonDecoration(),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    data.name,
                    style: AppTextStyles(context).display18W600,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  decoration: Utils().commonDecoration(
                      shadow: false,
                      color: data.tripType == TripType.upcoming
                          ? AppColors.primaryColor
                          : AppColors.colorF3F3F3),
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    data.tripType.name,
                    style: AppTextStyles(context).display12W400.copyWith(
                        color: data.tripType == TripType.upcoming
                            ? AppColors.white
                            : AppColors.black),
                  ),
                ).paddingSymmetric(horizontal: 9)
              ],
            ).paddingOnly(bottom: 10),
            Utils().dottedLine().paddingOnly(bottom: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data.startTime,
                  style: AppTextStyles(context).display32W500.copyWith(
                      color: data.tripType == TripType.completed
                          ? AppColors.color949495
                          : AppColors.primaryColor),
                ),
                Text(
                  data.tripType != TripType.completed ? "--" : data.endTime,
                  style: AppTextStyles(context)
                      .display32W500
                      .copyWith(color: AppColors.color949495),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Start Time",
                  style: AppTextStyles(context)
                      .display14W400
                      .copyWith(color: AppColors.color1E1E1E),
                ),
                Text(
                  "End Time",
                  style: AppTextStyles(context)
                      .display14W400
                      .copyWith(color: AppColors.color1E1E1E),
                ),
              ],
            ).paddingOnly(bottom: 10),
            Utils().dottedLine().paddingOnly(bottom: 10),
            Text(
              "People Onboard",
              style: AppTextStyles(context)
                  .display12W400
                  .copyWith(color: AppColors.color949495),
            ),
            Row(
              children: [
                peopleColumn(
                    data.noStudents,
                    "Students",
                    data.tripType == TripType.completed
                        ? AppColors.color949495
                        : AppColors.primaryColor),
                Utils().verticalDottedLine(),
                peopleColumn(
                    data.noCoord,
                    "Coordinator",
                    data.tripType == TripType.completed
                        ? AppColors.color949495
                        : AppColors.primaryColor),
                Utils().verticalDottedLine(),
                peopleColumn(
                    data.noStop,
                    "Stops",
                    data.tripType == TripType.completed
                        ? AppColors.color949495
                        : AppColors.primaryColor),
              ],
            )
          ],
        ),
      ).paddingOnly(bottom: 16),
    );
  }
}
