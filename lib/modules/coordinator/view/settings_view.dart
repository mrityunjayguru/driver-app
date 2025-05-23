import 'package:flutter_svg/flutter_svg.dart';
import 'package:route_roster_pro/config/app_sizer.dart';
import 'package:route_roster_pro/config/theme/app_textstyle.dart';
import 'package:route_roster_pro/generated/assets.dart';
import 'package:route_roster_pro/modules/guardian/model/bus_status_model.dart';
import 'package:route_roster_pro/modules/guardian/view/history_view.dart';
import 'package:route_roster_pro/utils/utils.dart';

import '../../../../config/theme/app_colors.dart';
import '../../../../utils/common_import.dart';
import '../../../utils/profile_info_widget.dart';
import '../controller/profile_controller.dart';
import 'history_view.dart';

class CoordinatorSettingsView extends StatelessWidget {
  CoordinatorSettingsView({super.key});

  final WidgetStateProperty<Icon?> thumbIcon =
      WidgetStateProperty.resolveWith<Icon?>(
    (Set<WidgetState> states) {
      return const Icon(Icons.close, color: Colors.transparent);
    },
  );
  final CoordinatorProfileController controller = Get.put(CoordinatorProfileController());

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
                Utils().topBar("Settings",
                    backIcon: false, rightIcon: Assets.svgActiveBellIcon),
                Text(
                  "Crafted by DesignDemonz",
                  style: AppTextStyles(context)
                      .display10W400
                      .copyWith(color: AppColors.color4B4749),
                ).paddingOnly(top: 10, left: 18),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                          shape: BoxShape.circle),
                      child: SvgPicture.asset(Assets.svgNotificationIcon),
                    ).paddingOnly(right: 10),
                    Expanded(
                        child: Text(
                      "Notifications",
                      style: AppTextStyles(context).display20W500,
                      overflow: TextOverflow.ellipsis,
                    )),
                    Switch(
                      thumbIcon: thumbIcon,
                      trackOutlineWidth: const WidgetStatePropertyAll(0),
                      trackOutlineColor:
                          const WidgetStatePropertyAll(Colors.transparent),
                      activeColor: AppColors.primaryColor,
                      value: true,
                      inactiveThumbColor: AppColors.primaryColor,
                      inactiveTrackColor: AppColors.colorF3F3F3,
                      activeTrackColor: AppColors.colorFEF1D6,
                      onChanged: (value) {},
                    )
                  ],
                ).paddingOnly(bottom: 16, left: 9 + 12, right: 9 + 12, top: 20),
                profileInfo(
                    header: "Coordinator Info",
                    name: 'Eliana Keller',
                    role: 'Teacher',
                    address: '1245 Maple Grove Lane Brookfield,Gurugram, Haryana',
                    phone: '+91 98765 43210',
                    img: ''),
                InkWell(
                  onTap: () {
                    Utils().navigate(CoordinatorHistoryView());
                  },
                  child: Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 9, vertical: 14),
                    decoration: Utils().commonDecoration(
                        color:AppColors.primaryColor,
                        shadow: false),
                    child: Center(
                      child: Text(
                       "Pickup/Drop-Off History",
                        style: AppTextStyles(context)
                            .display20W500
                            .copyWith(color: AppColors.white),
                      ),
                    ),
                  ),
                ).paddingSymmetric(horizontal: 12, vertical: 16)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
