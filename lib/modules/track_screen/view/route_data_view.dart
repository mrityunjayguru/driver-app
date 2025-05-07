import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../config/theme/app_colors.dart';
import '../../../config/theme/app_textstyle.dart';
import '../../../generated/assets.dart';
import '../../../utils/enums.dart';
import '../../../utils/utils.dart';
import '../controller/track_controller.dart';
import '../widgets/widgets.dart';
import 'map_view.dart';

class RouteDataView extends StatelessWidget {
  final controller = Get.isRegistered<TrackController>()
      ? Get.find<TrackController>() // Find if already registered
      : Get.put(TrackController());

  RouteDataView({super.key, required this.data});

  RouteData data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorF3F3F3,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Utils().topBar(data.name, backIcon: true),
              const SizedBox(
                height: 16,
              ),
              route(context),
              listItem(context).paddingSymmetric(horizontal: 12),
              peopleOnboard().paddingSymmetric(horizontal: 12),
              mapView().paddingSymmetric(horizontal: 12)
            ],
          ),
        ),
      ),
    );
  }

  Widget route(BuildContext context){
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: (){
                Get.to(() => MapView(data : data),
                    transition: Transition.upToDown,
                    duration: const Duration(milliseconds: 300));
              },
              child: Container(
                // height: ,
                decoration: Utils().commonDecoration(
                    color: AppColors.primaryColor, shadow: false),
                child: Center(
                  child: Text(
                    "Start Route",
                    style: AppTextStyles(context)
                        .display24W500
                        .copyWith(color: AppColors.white),
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              // margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              padding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              decoration:
              Utils().commonDecoration(color: AppColors.black),
              child: Column(
                children: [
                  SvgPicture.asset(Assets.svgIcCall)
                      .paddingOnly(bottom: 10),
                  Text(
                    "ADMIN",
                    style: AppTextStyles(context)
                        .display12W500
                        .copyWith(color: Colors.white),
                  )
                ],
              ),
            ),
          ).paddingOnly(left: 16)
        ],
      ).paddingSymmetric(horizontal: 12),
    );
  }
  Widget listItem(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 9),
      decoration: Utils().commonDecoration(),
      child: Column(
        children: [
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
          ),
          Utils().dottedLine().paddingSymmetric(vertical: 10),
          Row(
            children: [
              dataColumn("Date", data.date),
              Utils().verticalDottedLine(height: 23),
              dataColumn("Vehicle Number", data.vNo),
              Utils().verticalDottedLine(height: 23),
              dataColumn("Type", data.typeVehicle),
            ],
          ).paddingSymmetric(vertical: 7),
          Utils().dottedLine().paddingSymmetric(vertical: 10),
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
    ).paddingOnly(bottom: 16);
  }

  Widget peopleOnboard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: Utils().commonDecoration(),
      child: Column(
        children: [
          peopleRow(data.driverName, "Driver"),
          Utils().dottedLine().paddingSymmetric(vertical: 10),
          peopleRow(data.teacherName, "Teacher"),
          Utils().dottedLine().paddingSymmetric(vertical: 10),
          peopleRow(data.attendantName, "Attendant"),
        ],
      ),
    ).paddingOnly(bottom: 16);
  }

  Widget mapView() {
    return Container(
      height: 200,
      decoration: Utils().commonDecoration(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: GoogleMap(
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
    );
  }
}
