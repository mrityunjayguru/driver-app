import 'package:flutter_svg/flutter_svg.dart';
import 'package:route_roster_pro/config/app_sizer.dart';
import 'package:route_roster_pro/config/theme/app_textstyle.dart';
import 'package:route_roster_pro/generated/assets.dart';
import 'package:route_roster_pro/modules/guardian/controller/settings_controller.dart';
import 'package:route_roster_pro/modules/guardian/controller/settings_controller.dart';
import 'package:route_roster_pro/modules/guardian/model/bus_status_model.dart';
import 'package:route_roster_pro/modules/guardian/view/timeline_history.dart';
import 'package:route_roster_pro/utils/utils.dart';

import '../../../../config/theme/app_colors.dart';
import '../../../../utils/common_import.dart';
import '../controller/profile_controller.dart';

class HistoryView extends StatelessWidget {
  HistoryView({super.key});

  final WidgetStateProperty<Icon?> thumbIcon =
  WidgetStateProperty.resolveWith<Icon?>(
        (Set<WidgetState> states) {
      return const Icon(Icons.close, color: Colors.transparent);
    },
  );
  final SettingsController controller = Get.put(SettingsController());

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
                height: MediaQuery.of(context).size.height * 0.15,
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
                Utils().topBar("History",backIcon: true).paddingOnly(bottom: 40),
                Row(
                  children: [
                    Container(
                      width: context.width * 0.14,
                        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
                        decoration: BoxDecoration(
                            color:AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(AppSizes.radius_50),
                        ),
                        child: SvgPicture.asset(Assets.svgTimelineIcon).paddingOnly(left: 10)).paddingOnly(left: 12, right: 12),
                    RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        text: 'Pickup/Drop-Off\n',
                        style: AppTextStyles(context)
                            .display20W500,
                        children: [
                          TextSpan(
                            text: "Sofia Wagner",
                            style: AppTextStyles(context).display14W500,
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                      decoration: Utils().commonDecoration(color: AppColors.primaryColor, shadow: false),
                      child: RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          text: 'May ',
                          style: AppTextStyles(context)
                              .display18W600.copyWith(color: Colors.white),
                          children: [
                            TextSpan(
                              text: "2025",
                              style: AppTextStyles(context).display12W600.copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ).paddingOnly(left: 12, right: 12)
                  ],
                ),
                Expanded(child: StopTimeline(stops: controller.stops,)),
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
