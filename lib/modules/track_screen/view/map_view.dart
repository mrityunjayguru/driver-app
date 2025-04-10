import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:route_roster_pro/config/theme/app_textstyle.dart';
import 'package:route_roster_pro/utils/utils.dart';

import '../../../config/theme/app_colors.dart';
import '../../../generated/assets.dart';
import '../../../utils/common_import.dart';
import '../controller/track_controller.dart';

class MapView extends StatelessWidget {
  MapView({super.key, required this.data});

  RouteData data;
  final controller = Get.isRegistered<TrackController>()
      ? Get.find<TrackController>() // Find if already registered
      : Get.put(TrackController());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Stack(
        children: [
          Obx(
            () => GoogleMap(
              zoomControlsEnabled: false,
              mapType: MapType.normal,
              onMapCreated: (mapCon) {
                controller.mapController = mapCon;
                controller.showLoader.value = false;
              },
              initialCameraPosition: CameraPosition(
                target: controller.currentLocation.value,
                zoom: 7,
              ),
              markers: Set<Marker>.of(controller.markers),
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              mapToolbarEnabled: false,
              minMaxZoomPreference: const MinMaxZoomPreference(5, 19),
            ),
          ),
          topBar(context),
          Positioned.fill(
              bottom: 0, top: context.height * 0.71, child: bottomBar(context))
        ],
      ),
    );
  }

  Widget topBar(BuildContext context) {
    return Column(
      children: [
        Utils().topBar("Route 66"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
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
                        .display24W500
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
            ),
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
                      "ADMIN",
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
        Obx(()=>
           Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color:Utils.parseDouble(data: controller.speed.value) == 0 ? AppColors.color949495 : (Utils.parseDouble(data: controller.speed.value) <= 20) ? AppColors.color05A319:AppColors.colorF3434E, width: 3)),
            child: Column(
              children: [
                Text(
                  Utils.parseDouble(data: controller.speed.value) == 0 ? "--" : controller.speed.value,
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
        ),
        Container(
          constraints: const BoxConstraints(maxHeight: 75, minHeight: 75),
          width: context.width,
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          decoration: Utils().commonDecoration(),
          child: PageView(
            children: [
              swipePage(0, context),
              swipePage(1, context),
              swipePage(2, context),
            ],
          ),
        ).paddingSymmetric(horizontal: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: InkWell(
                onTap: (){
                  Get.back();
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  decoration: Utils().commonDecoration(
                      color: AppColors.primaryColor, shadow: false),
                  child: Center(
                    child: Text(
                      "Report Breakdown",
                      style: AppTextStyles(context)
                          .display16W600
                          .copyWith(color: AppColors.white),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: InkWell(
                onTap: (){
                  Get.back();
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  decoration: Utils()
                      .commonDecoration(color: Colors.black, shadow: false),
                  child: Center(
                    child: Text(
                      "End Route",
                      style: AppTextStyles(context)
                          .display16W600
                          .copyWith(color: AppColors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 12, vertical: 12)
      ],
    );
  }

  Widget swipePage(int number, BuildContext context) {
    return Row(
      children: [
        if (number != 0)
          SvgPicture.asset(Assets.svgLeftArr)
        else
          const SizedBox(
            width: 16,
          ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: AppColors.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      "1",
                      style: AppTextStyles(context)
                          .display14W500
                          .copyWith(color: AppColors.white),
                    ),
                  ).paddingOnly(right: 10),
                  Text(
                    "Next Stop",
                    style: AppTextStyles(context).display14W400,
                  ),
                ],
              ),
              Text(
                "Uttam Nagar",
                maxLines: 1,
                style: AppTextStyles(context)
                    .display20W500
                    .copyWith(color: AppColors.primaryColor),
              ),
            ],
          ).paddingSymmetric(horizontal: 10),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "ETA",
              style: AppTextStyles(context).display14W400.copyWith(height: 2),
            ),
            Text(
              "15 Min",
              style: AppTextStyles(context).display20W500,
            ),
          ],
        ).paddingSymmetric(horizontal: 10),
        if (number != 2)
          SvgPicture.asset(Assets.svgRightArr)
        else
          const SizedBox(
            width: 16,
          ),
      ],
    );
  }
}
