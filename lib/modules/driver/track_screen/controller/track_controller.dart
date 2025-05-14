import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../utils/common_import.dart';
import '../../../../utils/enums.dart';
import '../../../../utils/utils.dart';

class TrackController extends GetxController {
  var markers = <Marker>[].obs;

  var currentLocation = LatLng(20.5937, 78.9629).obs;

  var speed = "0".obs;
  var address = "Fetching....".obs;

  late GoogleMapController mapController;

  RxBool showLoader = false.obs;

  // var routeList = <RouteData>[].obs;
  List<RouteData> routeList = [
    RouteData(
      name: 'Morning Route 1',
      noStop: '10',
      noStudents: '45',
      noCoord: '3',
      startTime: '07:00',
      endTime: '08:00',
      date: '2025-04-10',
      vNo: 'MH12AB1234',
      typeVehicle: 'Bus',
      driverName: 'John Doe',
      teacherName: 'Ms. Smith',
      attendantName: 'Raj',tripType: TripType.upcoming
    ),
    RouteData(
      name: 'Morning Route 2',
      noStop: '8',
      noStudents: '40',
      noCoord: '2',
      startTime: '07:15',
      endTime: '08:10',
      date: '2025-04-10',
      vNo: 'MH12CD5678',
      typeVehicle: 'Van',
      driverName: 'Ali Khan',
      teacherName: 'Mr. Thomas',
      attendantName: 'Sneha', tripType: TripType.scheduled,
    ),
    RouteData(
      name: 'Evening Route 1',
      noStop: '12',
      noStudents: '50',
      noCoord: '4',
      startTime: '15:00',
      endTime: '16:00',
      date: '2025-04-10',
      vNo: 'MH12EF9012',
      typeVehicle: 'Bus',
      driverName: 'Vinod Kumar',
      teacherName: 'Mrs. Fernandez',
      attendantName: 'Aarti',tripType: TripType.completed
    ),
    RouteData(
      name: 'Evening Route 2',
      noStop: '9',
      noStudents: '38',
      noCoord: '2',
      startTime: '15:15',
      endTime: '16:10',
      date: '2025-04-10',
      vNo: 'MH12GH3456',
      typeVehicle: 'Mini Bus',
      driverName: 'Ravi Patil',
      teacherName: 'Mr. Mehta',
      attendantName: 'Pooja',tripType: TripType.completed
    ),
  ];

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



class RouteData {
  String name;
  String noStop;
  String noStudents;
  String noCoord;
  String startTime;
  String endTime;
  String date;
  String vNo;
  String typeVehicle;
  String driverName;
  String teacherName;
  String attendantName;
  TripType tripType;

  RouteData({
    required this.name,
    required this.noStop,
    required this.noStudents,
    required this.noCoord,
    required this.startTime,
    required this.endTime,
    required this.date,
    required this.vNo,
    required this.typeVehicle,
    required this.driverName,
    required this.teacherName,
    required this.attendantName,
    required this.tripType,
  });


}

