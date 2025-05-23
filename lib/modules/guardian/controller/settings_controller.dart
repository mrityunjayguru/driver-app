import 'package:get/get.dart';

import '../model/bus_status_model.dart';
import '../model/stop_model.dart';

class SettingsController extends GetxController {
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
        gender: true,
        cancelled: false,
        schoolName: "Euro International School"),
    StudentBusStatus(
        name: "Aaru Gautam",
        admissionNo: "8888",
        grade: "Mont Venus",
        routeNo: 24,
        pickupPoint: "Gaur City 1 Gate",
        busStatus: "In Transit",
        pickupTime: "09:30",
        dropTime: "01:30",
        gender: false,
        schoolName: "Scottish High International School",
        cancelled: true),
  ];

  List<Stop> stops = [
    Stop(time: "07:00", date: "15", month: "May", holiday: false),
    Stop(time: "02:44", date: "15", month: "May", holiday: false, ),
    Stop(time: "07:01", date: "15", month: "May", holiday: false, ),
    Stop(time: "02:45", date: "15", month: "May", holiday: false, ),
    Stop(time: "07:04", date: "15", month: "May", holiday: false,  canceledPickup: true),
    Stop(time: "02:41", date: "15", month: "May", holiday: true, ),
    Stop(time: "07:02", date: "15", month: "May", holiday: false, ),
    Stop(time: "02:46", date: "15", month: "May", holiday: false,  canceledDropOff: true),
  ];

}
