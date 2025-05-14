import 'package:get/get.dart';

import '../model/bus_status_model.dart';

class BusStatusController extends GetxController{
  final List<StudentBusStatus> studentBusStatusList = [
    StudentBusStatus(
      name: "Kannu Chaudhary",
      admissionNo: "6666",
      grade: "IV Mercury",
      routeNo: 12,
      pickupPoint: "Main Market",
      busStatus: "At School",
      pickupTime: "07:00",
      dropTime: "02:45",
      gender: true
    ),
    StudentBusStatus(
      name: "Aaru Gautam",
      admissionNo: "8888",
      grade: "Mont Venus",
      routeNo: 24,
      pickupPoint: "Gaur City 1 Gate",
      busStatus: "In Transit",
      pickupTime: "09:30",
      dropTime: "01:30",
      gender: false
    ),
  ];

}