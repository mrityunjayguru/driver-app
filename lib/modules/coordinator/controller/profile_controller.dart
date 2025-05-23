import 'package:get/get.dart';
import 'package:route_roster_pro/modules/bottom_screen/controller/bottom_bar_controller.dart';

import '../../../utils/common_import.dart';
import '../../guardian/model/bus_status_model.dart';

class CoordinatorProfileController extends GetxController {
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

  void switchTabs(int tab) {
   try{
     final controller = Get.find<BottomBarController>();
     debugPrint("sel index ${controller.selectedIndex.value}");
     controller.switchToBusView(0, tab);
   }
   catch(e){
     debugPrint("$e");
   }

  }
}
