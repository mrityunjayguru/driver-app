import 'dart:io';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:route_roster_pro/config/theme/app_textstyle.dart';
import 'package:route_roster_pro/generated/assets.dart';
import 'package:route_roster_pro/modules/coordinator/view/route_history_info_view.dart';
import 'package:route_roster_pro/modules/coordinator/view/widgets/route_widget.dart';
import 'package:route_roster_pro/modules/guardian/model/bus_status_model.dart';
import 'package:route_roster_pro/utils/enums.dart';
import 'package:route_roster_pro/utils/utils.dart';

import '../../../../config/theme/app_colors.dart';
import '../../../../utils/common_import.dart';
import '../controller/settings_controller.dart';

class CoordinatorHistoryView extends StatelessWidget {
  CoordinatorHistoryView({super.key});

  final WidgetStateProperty<Icon?> thumbIcon =
      WidgetStateProperty.resolveWith<Icon?>(
    (Set<WidgetState> states) {
      return const Icon(Icons.close, color: Colors.transparent);
    },
  );
  final CoordinatorSettingsController controller =
      Get.put(CoordinatorSettingsController());

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Utils()
                    .topBar("Route History", backIcon: true)
                    .paddingOnly(bottom: 40),
                Center(
                    child: Text(
                  "22 May 2025",
                  style: AppTextStyles(context)
                      .display16W600
                      .copyWith(color: AppColors.primaryColor),
                ).paddingOnly(top: 10, bottom: 10)),
                Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => routeWidget(
                      onTapContainer: (){
                        Get.to(()=>RouteHistoryInfoView());
                        // Utils().navigate(RouteHistoryInfoView());
                      },
                        routeName: "12",
                        label: 'Drop-Off',
                        time: '12:30',
                        stopList: '12',
                        students: '100',
                        staffCount: '2',
                        tripType: index > 1
                            ? TripType.completed
                            : TripType.scheduled,
                        applyBgColor: false),
                    itemCount: controller.studentBusStatusList.length + 1,
                  ),
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
    return Column(
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
    ).paddingOnly(bottom: 16);
  }
}
