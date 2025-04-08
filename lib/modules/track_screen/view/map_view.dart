import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../utils/common_import.dart';
import '../controller/track_controller.dart';

class MapView extends StatelessWidget{
   MapView({super.key});
  final controller = Get.isRegistered<TrackController>()
      ? Get.find<TrackController>() // Find if already registered
      : Get.put(TrackController());
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Obx(()=>
          GoogleMap(
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
            markers:Set<Marker>.of(controller.markers),
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            mapToolbarEnabled: false,
            minMaxZoomPreference: const MinMaxZoomPreference(5, 19),
          ),
        ),
        Positioned(
          top: 16,
          left: 16,
          child: Obx(() => Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 4)],
            ),
            child: Column(
              children: [
                Text(
                  "Speed: ${controller.speed.value} km/h",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Address: ${controller.address.value}",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )),
        ),
      ],
    );
  }

}