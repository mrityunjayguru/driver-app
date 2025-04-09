import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../utils/common_import.dart';
import '../../../utils/utils.dart';

class TrackController extends GetxController {
  var markers = <Marker>[].obs;

  var currentLocation = LatLng(20.5937, 78.9629).obs;

  var speed = "0".obs;
  var address = "Fetching....".obs;

  late GoogleMapController mapController;

  RxBool showLoader = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkStatus();
    showLoader.value = true;

    /*loadUser().then(
          (value) {
        devicesByOwnerID(false);
      },
    );*/

    /*// Set up a timer to call `devicesByOwnerID` every 30 seconds if `isEdit` is false
    _refreshTimer = Timer.periodic(Duration(seconds: 10), (timer) {
      if (!isedit.value) {
        devicesByOwnerID(false);
      }
    });*/
  }

  Future<void> checkStatus() async {
    bool permissionGranted = await Utils().isPermissionGranted();
    bool gpsEnabled = await Utils().isGpsEnabled();

    if (gpsEnabled && permissionGranted) {
      _startLocationTracking();
    } else {
      if (!gpsEnabled) await Utils().requestEnableGps();
      if (!permissionGranted) {
        bool permissionGranted = await Utils().requestLocationPermission();
        if (permissionGranted) {
          _startLocationTracking();
        } else {
          Utils.getSnackbar("Please turn on device location", "");
        }
      }
    }
  }

  void _startLocationTracking({bool updateCamera = true}) async {
    Position pos = await Geolocator.getCurrentPosition();

    currentLocation.value = LatLng(pos.latitude, pos.longitude);
    if (updateCamera) {
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: currentLocation.value, zoom: 7),
        ),
      );
    }

    Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.best,
        distanceFilter: 0,
      ),
    ).listen((Position position) async {
      debugPrint("position ${position.speed}");
      speed.value = (position.speed * 3.6)
          .round().toInt()
          .toString(); // Convert m/s to km/h
      currentLocation.value = LatLng(position.latitude, position.longitude);
      markers.value = [
        Marker(
          markerId: const MarkerId('driver'),
          position: currentLocation.value,
          flat: true,
          onTap: (){
            mapController!.animateCamera(
              CameraUpdate.zoomIn(),

            );
          },
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        )
      ];
      debugPrint("marker ${markers.value.first.markerId}");
      // Move camera to the new position
      if (mapController != null) {
        mapController!.animateCamera(
          CameraUpdate.newLatLng(currentLocation.value),
        );
      }
      update();
      address.value = await Utils()
          .getAddressFromLatLong(position.latitude, position.longitude);

      update();
    });
  }
}
